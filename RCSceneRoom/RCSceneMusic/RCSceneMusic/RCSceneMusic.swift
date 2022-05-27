//
//  RCSceneMusic.swift
//  RCSceneRoom
//
//  Created by shaoshuai on 2022/5/23.
//

import RCMusicControlKit

public struct RCSceneMusicConfig {
    let appId: String
    let version: String
    let clientId: String
    let serverCode: String
    
    public init(appId: String, code: String, version: String, clientId: String) {
        self.appId = appId
        self.serverCode = code
        self.version = version
        self.clientId = clientId
    }
}

public class RCSceneMusic {
    /// 配置音乐数据和播放控制器
    /// - Parameter clientId: 客户端 id，可以传入 userId
    public static func active(_ config: RCSceneMusicConfig) {
        guard config.clientId.count > 0 else { return debugPrint("clientId empty") }
        musicConfig = config
        RCMusicEngine.shareInstance().delegate = RCSMusicDelegate.instance
        RCMusicEngine.shareInstance().player = RCSMusicPlayer.instance
        RCMusicEngine.shareInstance().dataSource = RCSMusicDataSource.instance
    }
    
    public static func join(_ room: RCSceneRoom, bubbleView: RCMusicInfoBubbleView) {
        RCCoreClient.shared().add(RCSMusicPlayer.instance)
        RCSMusicPlayer.instance.bubbleView = bubbleView
        guard let config = musicConfig, config.clientId.count > 0 else {
            return
        }
        currentRoom = room
        RCSMusicPlayer.instance.initializedEarMonitoring()
        guard room.userId != config.clientId else {
            return
        }
        RCSMusicDataSource.instance.fetchRoomPlayingMusicInfo { info in
            bubbleView.info = info;
        }
    }
    
    public static func stop() {
        guard let room = currentRoom else {
            return
        }
        guard room.userId == musicConfig?.clientId else {
            return
        }
        switch RCSMusicPlayer.instance.currentPlayState {
        case .mixingStatePlaying, .mixingStatePause: ()
        default: return
        }
        RCSMusicPlayer.instance.stopMixing(with: nil)
    }
    
    public static func clear() {
        currentRoom = nil
        RCSMusicDataSource.instance.clear()
        RCSMusicPlayer.instance.clear()
        RCSMusicDelegate.instance.clear()
    }
}

var musicConfig: RCSceneMusicConfig?
var currentRoom: RCSceneRoom?
