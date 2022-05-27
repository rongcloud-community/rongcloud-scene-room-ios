//
//  PlayerMediator.swift
//  RCE
//
//  Created by xuefeng on 2021/11/28.
//

import RongRTCLib
import SVProgressHUD
import RCMusicControlKit

public typealias PlayerImpl = RCSMusicPlayer

private let kMusicBubbleViewEventName = "RCVoiceSyncMusicInfoKey"

public class RCSMusicPlayer: NSObject, RCMusicPlayer, RCRTCAudioMixerAudioPlayDelegate {
    
    public static let instance = RCSMusicPlayer()
    
    //用户耳返开关状态
    private var openEarMonitoring = false

    //当前正在播放的音乐
    public var currentPlayingMusic: RCMusicInfo?
    //当前的播放器状态
    public var currentPlayState: RCRTCAudioMixingState = .mixingStateStop
    
    //语聊房静音需要同步暂停音乐
    
    var needResumePlayer = false
    
    weak var bubbleView: RCMusicInfoBubbleView?
    
    public var isSilence: Bool = false {
        willSet {
            if (newValue) {
                if (currentPlayState == .mixingStatePlaying) {
                    self.pause()
                    needResumePlayer = true
                }
            }
        }
        
        didSet {
            if (!isSilence) {
                if (needResumePlayer) {
                    self.resume()
                    needResumePlayer = false
                }
            }
        }
    }
    
    //被暂停的音乐
    var currentPausingMusic: RCMusicInfo?
    
    private override init() {
        super.init()
        RCRTCAudioMixer.sharedInstance().delegate = self
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(onRouteChanged(_:)),
                         name: AVAudioSession.routeChangeNotification,
                         object: nil)

    }
    
    public func initializedEarMonitoring() {
        setEarOpenMonitoring(openEarMonitoring)
    }

    public func localVolume() -> Int {
        return Int(RCRTCAudioMixer.sharedInstance().playingVolume)
    }
    
    public func setLocalVolume(_ volume: Int) {
        RCRTCAudioMixer.sharedInstance().playingVolume = UInt(volume)
    }
    
    public func remoteVolume() -> Int {
        return Int(RCRTCAudioMixer.sharedInstance().mixingVolume)
    }
    
    public func setRemoteVolume(_ volume: Int) {
        RCRTCAudioMixer.sharedInstance().mixingVolume = UInt(volume)
    }
    
    public func micVolume() -> Int {
        return Int(RCRTCEngine.sharedInstance().defaultAudioStream.recordingVolume)
    }
    
    public func setMicVolume(_ volume: Int) {
        RCRTCEngine.sharedInstance().defaultAudioStream.recordingVolume = UInt(volume)
    }
    
    public func setEarOpenMonitoring(_ on: Bool) {
        openEarMonitoring = on && isHeadsetPluggedIn()
        RCMusicEngine.shareInstance().openEarMonitoring = openEarMonitoring
        RCRTCEngine.sharedInstance().audioEffectManager.enable(inEarMonitoring:openEarMonitoring)

    }
    
    public func startMixing(with info: RCMusicInfo) -> Bool {
        
        if (isSilence) {
            SVProgressHUD.showError(withStatus: "当前为静音模式不允许播放音乐")
            return false
        }
        
        if let pausingMusic = currentPausingMusic,
            currentPlayState == .mixingStatePause,
            pausingMusic.musicId == info.musicId {
            currentPlayingMusic = info
            return RCRTCAudioMixer.sharedInstance().resume()
        }
        
        guard let fileName = info.musicId, let musicDir = RCSMusicDataSource.musicDir() else {
            print("startMixing info fileName must be nonnull");
            return false
        }
        var success = false
        let filePath = musicDir + "/" + fileName
        if (!FileManager.default.fileExists(atPath: filePath)) {
            RCSMusicDataSource.instance.fetchMusicDetail(with: info) { detail in
                guard let music = detail as? MusicInfo else {
                    return
                }
                MusicDownloader.shared.hifiveDownload(music: music) { success in
                    self.currentPlayingMusic = info;
                    let _ = RCRTCAudioMixer.sharedInstance().startMixing(with: URL(fileURLWithPath: filePath), playback: true, mixerMode: .mixing, loopCount: 1)
                }
            }
        } else {
            currentPlayingMusic = info;
            success = RCRTCAudioMixer.sharedInstance().startMixing(with: URL(fileURLWithPath: filePath), playback: true, mixerMode: .mixing, loopCount: 1)
        }
        return success
    }
    
    @discardableResult
    public func stopMixing(with info: RCMusicInfo?) -> Bool {
        if let info = info ,let currentInfo = currentPlayingMusic, info.musicId == currentInfo.musicId {
            return pause()
        }
        currentPlayingMusic = nil
        return RCRTCAudioMixer.sharedInstance().stop()
    }
    
    @discardableResult
    func pause() -> Bool {
        return RCRTCAudioMixer.sharedInstance().pause()
    }
    
    @discardableResult
    func resume() -> Bool {
        if (isSilence) {
            SVProgressHUD.showError(withStatus: "当前为静音模式不允许播放音乐")
            return false
        }
        return RCRTCAudioMixer.sharedInstance().resume()
    }
    
    public func playEffect(_ soundId: Int, filePath: String) {
        RCRTCEngine.sharedInstance().audioEffectManager.stopAllEffects()
        RCRTCEngine.sharedInstance().audioEffectManager.playEffect(soundId, filePath: filePath, loopCount: 1, publish: true)
    }
    
    public func didAudioMixingStateChanged(_ mixingState: RCRTCAudioMixingState, reason mixingReason: RCRTCAudioMixingReason) {
        //TODO
        //mixingState 状态不准确，已经确认是 rtc bug 下个版本修复
        //临时使用reason设置play状态
        currentPlayState = mixingReason == .mixingReasonPausedByUser ? .mixingStatePause : mixingState
    
        handleState(currentPlayState)
                
        syncRoomPlayingMusicInfo { [weak self] in
            guard let self = self else { return }
            self.sendCommandMessage()
        }
        
        RCMusicEngine.shareInstance().asyncMixingState(RCMusicMixingState(rawValue: UInt(mixingState.rawValue)) ?? .playing)
    }
    
    public func didReportPlayingProgress(_ progress: Float) {
    }
    
    func handleState(_ mixingState: RCRTCAudioMixingState) {
        if (mixingState == .mixingStateStop) {
            handleStopState()
        } else if (mixingState == .mixingStatePause) {
            handlePauseState()
        } else {
            handlePlayState()
        }
    }
    
    func handleStopState() {
        guard let tmp = currentPlayingMusic as? MusicInfo,
              let musics = RCSMusicDataSource.instance.musics,
              let index = musics.firstIndex(of: tmp) else { return }
        if (index >= musics.count - 1) {
            currentPausingMusic = nil
            let _ = stopMixing(with: nil)
        } else {
            let _ = startMixing(with: musics[index+1])
        }
    }
    
    func handlePauseState() {
        currentPausingMusic = currentPlayingMusic
        currentPlayingMusic = nil
    }
    
    func handlePlayState() {
        if (needResumePlayer) {
            if let currentPausingMusic = currentPausingMusic {
                currentPlayingMusic = currentPausingMusic
            }
            currentPausingMusic = nil
        }
    }
    
    func sendCommandMessage() {
        //发送控制消息 同步歌曲信息到观众房间
        let musicId = (currentPlayingMusic as? MusicInfo)?.id ?? 0
        let message = RCCommandMessage(name: kMusicBubbleViewEventName,
                                       data: String(musicId))!
        var roomId: String? = RCRTCEngine.sharedInstance().room.roomId
        guard let roomId = roomId else { return }
        RCCoreClient.shared()
            .sendMessage(.ConversationType_CHATROOM,
                         targetId: roomId,
                         content: message,
                         pushContent: "",
                         pushData: "") { mId in
                RCSRLog.debug("voice 同步歌曲信息消息发送成功")
            } error: { code, mId in
                RCSRLog.error("voice 同步歌曲信息消息发送失败 code: \(code) mId: \(mId)")
            }
    }
    
    func syncRoomPlayingMusicInfo(_ completion: @escaping () -> Void) {
        let info = currentPlayingMusic as? MusicInfo
        RCSMusicDelegate.instance.syncPlayingMusicInfo(info,completion)
    }
    
    public func clear() {
        let tmp = currentPlayingMusic
        currentPlayingMusic = nil
        currentPausingMusic = nil
        needResumePlayer = false
        isSilence = false
        if (tmp != nil) {
            let _ = stopMixing(with: nil)
        }
    }
    
    private func isHeadsetPluggedIn() -> Bool {
        let route = AVAudioSession.sharedInstance().currentRoute
        let isHeadsetPluggedIn = route.outputs.contains { desc in
            switch desc.portType {
            case .bluetoothLE,
                 .bluetoothHFP,
                 .bluetoothA2DP,
                 .headphones:
                return true
            default: return false
            }
        }
        return isHeadsetPluggedIn
    }
    
    @objc private func onRouteChanged(_ notification: Notification) {
        setEarOpenMonitoring(openEarMonitoring)
    }
}

extension RCSMusicPlayer: RCIMClientReceiveMessageDelegate {
    public func onReceived(_ message: RCMessage!, left nLeft: Int32, object: Any!) {
        guard
            let content = message.content as? RCCommandMessage,
            content.name == kMusicBubbleViewEventName
        else { return }
        if content.data == "0" { updateBubble() }
        RCSMusicDataSource.instance.fetchCollectMusics { [weak self] infos in
            let items = infos?.compactMap { $0 as? MusicInfo }
            let info = items?.first { "\($0.id ?? 0)" == content.data }
            self?.updateBubble(info)
        }
    }
    
    private func updateBubble(_ info: MusicInfo? = nil) {
        DispatchQueue.main.async {
            self.bubbleView?.info = info
        }
    }
}
