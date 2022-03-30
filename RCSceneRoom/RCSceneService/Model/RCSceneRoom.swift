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
    let updateDt: TimeInterval
    public let createUser: RCSceneRoomUser?
    public var userTotal: Int
    public let roomType: Int?  /// (1 || null):语聊房,2:电台,3:直播
    public let stop: Bool
    public var notice: String?
}
