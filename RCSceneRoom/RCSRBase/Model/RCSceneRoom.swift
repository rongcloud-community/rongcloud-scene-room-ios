
import UIKit

public struct RCSceneRoom: Codable, Identifiable, Equatable {
    public let id: Int
    public let roomId: String
    public var roomName: String
    public var themePictureUrl: String?
    public var backgroundUrl: String?
    public var isPrivate: Int
    public var password: String?
    public let userId: String
    public let updateDt: TimeInterval
    public let createUser: RCSceneRoomUser?
    public var userTotal: Int
    public let roomType: Int?  /// (1 || null):语聊房,2:电台,3:直播
    public let stop: Bool
    public var notice: String?
    
    public let gameId: String?
    public var gameResp: RCSceneGameResp?
    public var gameStatus: Int?
    
}

public struct RCSceneGameResp: Codable, Equatable {
    public let gameId: String
    public let gameDesc: String
    public let gameMode: Int
    public let gameName: String
    public let loadingPic: String
    public let maxSeat: Int
    public let minSeat: Int
    public let thumbnail: String
    
    public init(gameId: String,
                gameDesc: String,
                gameMode: Int,
                gameName: String,
                loadingPic: String,
                maxSeat: Int,
                minSeat: Int,
                thumbnail: String) {
        self.gameId = gameId
        self.gameDesc = gameDesc
        self.gameMode = gameMode
        self.gameName = gameName
        self.loadingPic = loadingPic
        self.maxSeat = maxSeat
        self.minSeat = minSeat
        self.thumbnail = thumbnail
    }
}
