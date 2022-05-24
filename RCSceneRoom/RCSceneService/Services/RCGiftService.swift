//
//  RCGiftService.swift
//  RCE
//
//  Created by xuefeng on 2022/2/7.
//

import Foundation
import Moya

public let giftProvider = RCSProvider<RCGiftService>(plugins: [RCSServiceLogger])

public enum RCGiftService {
    case giftList(roomId: String)
    case sendGift(roomId: String, giftId: String, toUid: String, num: Int)
}

extension RCGiftService: RCSServiceType {
    public var path: String {
        switch self {
        case let .giftList(roomId):
            return "mic/room/\(roomId)/gift/list"
        case .sendGift:
            return "mic/room/gift/add"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .giftList:
            return .get
        case .sendGift:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .giftList:
            return .requestPlain
        case let .sendGift(roomId, giftId, toUid, num):
            return .requestParameters(parameters: ["roomId": roomId, "giftId": giftId, "toUid": toUid, "num": num],
                                      encoding: JSONEncoding.default)
        }
    }
}

