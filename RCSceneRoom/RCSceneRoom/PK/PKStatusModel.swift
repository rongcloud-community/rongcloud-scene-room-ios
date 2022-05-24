//
//  PKStatusModel.swift
//  RCE
//
//  Created by zangqilong on 2021/10/28.
//

import Foundation

public enum PKStatus: Int {
    case begin = 0
    case pause
    case close
    
    public var name: String {
        switch self {
        case .begin:
            return "开始"
        case .pause:
            return "暂停"
        case .close:
            return "结束"
        }
    }
}

public struct PKStatusModel: Codable {
    public let statusMsg: Int
    public var timeDiff: Int
    public var seconds: Int {
        return timeDiff/1000
    }
    public let roomScores: [PKStatusRoomScore]
}

public struct PKGiftModel: Codable {
    public let roomScores: [PKStatusRoomScore]
    
    public init(roomScores: [PKStatusRoomScore]) {
        self.roomScores = roomScores
    }
}

public struct PKStatusRoomScore: Codable {
    public let leader: Bool
    public let userId: String
    public let roomId: String
    public let score: Int
    public let userInfoList: [PKSendGiftUser]
}

public struct PKSendGiftUser: Codable {
    public let userId: String
    public let userName: String
    public let portrait: String
}
