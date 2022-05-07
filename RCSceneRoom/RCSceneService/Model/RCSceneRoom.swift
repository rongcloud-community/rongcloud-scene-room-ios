//
//  VoiceRoom.swift
//  RCE
//
//  Created by 叶孤城 on 2021/4/27.
//

import UIKit

public struct RCSceneRoom: Codable, Identifiable, Equatable {
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
    
    public init(id: Int, roomId: String, roomName: String, themePictureUrl: String, backgroundUrl: String?, isPrivate: Int, password: String?, userId: String, updateDt: TimeInterval, createUser: RCSceneRoomUser?, userTotal: Int, roomType: Int?, stop: Bool, notice: String?) {
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
    }
}
