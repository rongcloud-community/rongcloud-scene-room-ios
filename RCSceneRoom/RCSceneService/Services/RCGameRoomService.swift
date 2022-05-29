//
//  RCGameRoomService.swift
//  RCSceneGameRoom
//
//  Created by johankoi on 2022/5/29.
//

import Foundation
import Moya

public let gameRoomProvider = MoyaProvider<RCGameRoomService>(plugins: [RCServicePlugin])

public enum RCGameRoomService {
    case createGameRoom(name: String, themePictureUrl: String, backgroundUrl: String, kv: [[String: String]], isPrivate: Int, password: String?, roomType: Int, gameId: String)
    case gameEngineLogin(userId: String)
}

extension RCGameRoomService: RCServiceType {
    public var path: String {
        switch self {
        case .createGameRoom:
            return "mic/room/create"
        case .gameEngineLogin:
            return "mic/game/login"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .createGameRoom:
            return .post
        case .gameEngineLogin:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case let .createGameRoom(name, themePictureUrl, backgroundUrl, kv, isPrivate, password, roomType, gameId):
            var params: [String: Any] = ["name": name, "themePictureUrl": themePictureUrl, "kv": kv, "isPrivate": isPrivate, "backgroundUrl": backgroundUrl, "roomType": roomType, "gameId": gameId]
            if let password = password {
                params["password"] = password
            }
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case let .gameEngineLogin(userId):
            let params: [String: Any] = ["userId": userId]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        }
    }
}

