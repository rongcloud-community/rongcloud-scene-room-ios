//
//  VoiceRoomManager.swift
//  RCE
//
//  Created by shaoshuai on 2021/6/3.
//

public enum HomeItem: Int, CaseIterable {
    case audioRoom = 1
    case audioCall = 11
    case videoCall = 10
    case liveVideo = 3
    case radioRoom = 2
    case gameRoom = 4
    
    public var name: String {
        switch self {
        case .audioRoom:
            return "语聊房"
        case .radioRoom:
            return "语音电台"
        case .videoCall:
            return "视频通话"
        case .audioCall:
            return "语音通话"
        case .liveVideo:
            return "视频直播"
        case .gameRoom:
            return "游戏房"
        }
    }
    
    public var desc: String {
        switch self {
        case .audioRoom:
            return "超大聊天室，支持麦位、麦序\n管理，涵盖KTV等多种玩法"
        case .radioRoom:
            return "听众端采用CDN链路 支持人数无上限"
        case .videoCall:
            return "低延迟、高清晰度视频通话"
        case .audioCall:
            return "拥有智能降噪的无差别 电话体验"
        case .liveVideo:
            return "视频直播间，支持高级美颜、观众连麦互动"
        case .gameRoom:
            return "多种游戏，快速匹配"
        }
    }
}

public enum SceneRoomUserType {
    case creator
    case manager
    case audience
}

public class SceneRoomManager {
    public static let shared = SceneRoomManager()
    
    public let queue = DispatchQueue(label: "voice_room_join_or_leave")
    
    /// 当前场景类型，进入room时，用room.roomType
    public static var scene = HomeItem.audioRoom
    /// 当前所在房间
    public var currentRoom: RCSceneRoom?
    /// 管理员
    public var managers = [String]()
    /// 房间背景
    public var backgrounds = [String]()
    /// 屏蔽词
    public var forbiddenWords = [String]()
    /// 麦位信息
    public var seats = [String]()
    
    public func clear() {
        seats.removeAll()
        managers.removeAll()
        backgrounds.removeAll()
        forbiddenWords.removeAll()
    }
}
