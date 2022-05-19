//
//  RCSceneGameRoom.swift
//  RCSceneRoom
//
//  Created by Leo on 2022/5/18.
//

import Foundation

public struct RCSceneGameRoom: Codable, Identifiable, Equatable {
    public let id: Int
    public let roomId: String
    public var roomName: String
    public var themePictureUrl: String
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
    public let gameResp: RCSceneGameResp
    public var gameStatus: Int?
    
    public init(id: Int, roomId: String, roomName: String, themePictureUrl: String, backgroundUrl: String?, isPrivate: Int, password: String?, userId: String, updateDt: TimeInterval, createUser: RCSceneRoomUser?, userTotal: Int, roomType: Int?, stop: Bool, notice: String?, gameId: String?, gameResp: RCSceneGameResp, gameStatus: Int?) {
        self.id = id
        self.roomId = roomId
        self.roomName = roomName
        self.themePictureUrl = themePictureUrl
        self.backgroundUrl = backgroundUrl
        self.isPrivate = isPrivate
        self.password = password
        self.userId = userId
        self.updateDt = updateDt
        self.createUser = createUser
        self.userTotal = userTotal
        self.roomType = roomType
        self.stop = stop
        self.notice = notice
        self.gameId = gameId
        self.gameResp = gameResp
        self.gameStatus = gameStatus
    }
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
