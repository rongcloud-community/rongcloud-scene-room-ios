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
        RCMusicEngine.shareInstance().delegate = DelegateImpl.instance
        RCMusicEngine.shareInstance().player = PlayerImpl.instance
        RCMusicEngine.shareInstance().dataSource = DataSourceImpl.instance
    }
    
    public static func join(_ room: RCSceneRoom) {
        guard let config = musicConfig, config.clientId.count > 0 else {
            return
        }
        currentRoom = room
        PlayerImpl.instance.initializedEarMonitoring()
        if room.userId != config.clientId {
            DataSourceImpl.instance.fetchRoomPlayingMusicInfo { info in
                RCMusicEngine.musicInfoBubbleView?.info = info;
            }
        }
    }
    
    public static func stop() {
        guard let room = currentRoom else {
            return
        }
        guard room.userId == musicConfig?.clientId else {
            return
        }
        switch PlayerImpl.instance.currentPlayState {
        case .mixingStatePlaying, .mixingStatePause: ()
        default: return
        }
        PlayerImpl.instance.stopMixing(with: nil)
    }
    
    public static func clear() {
        currentRoom = nil
        DataSourceImpl.instance.clear()
        PlayerImpl.instance.clear()
        DelegateImpl.instance.clear()
    }
}

var musicConfig: RCSceneMusicConfig?
var currentRoom: RCSceneRoom?
