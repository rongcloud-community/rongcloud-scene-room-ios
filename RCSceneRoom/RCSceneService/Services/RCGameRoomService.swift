//
//  RCGameRoomService.swift
//  RCSceneGameRoom
//
//  Created by johankoi on 2022/5/29.
//

import Foundation
import Moya

public let gameRoomProvider = MoyaProvider<RCGameRoomService>(plugins: [RCSServiceLogger])

public enum RCGameRoomService {
    case gameList
    case createGameRoom(name: String, themePictureUrl: String, backgroundUrl: String, kv: [[String: String]], isPrivate: Int, password: String?, roomType: Int, gameId: String)
    case gameEngineLogin(userId: String)
    case fastJoin(gameId: String)
    case switchGame(gameId: String, gameState: Int, roomId: String)
    case gameStatus(gameId: String, gameState: Int, roomId: String)
}

extension RCGameRoomService: RCSServiceType {
    public var path: String {
        switch self {
        case .gameList:
            return "mic/game/list"
        case .createGameRoom:
            return "mic/room/create"
        case .gameEngineLogin:
            return "mic/game/login"
        case .fastJoin:
            return "mic/game/join"
        case .switchGame:
            return "mic/game/toggle/game_id"
        case .gameStatus:
            return "mic/game/toggle/game_status"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .gameList:
            return .get
        case .createGameRoom:
            return .post
        case .gameEngineLogin:
            return .post
        case .fastJoin:
            return .get
        case .switchGame:
            return .post
        case .gameStatus:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .gameList:
            return .requestPlain
        case let .createGameRoom(name, themePictureUrl, backgroundUrl, kv, isPrivate, password, roomType, gameId):
            var params: [String: Any] = ["name": name, "themePictureUrl": themePictureUrl, "kv": kv, "isPrivate": isPrivate, "backgroundUrl": backgroundUrl, "roomType": roomType, "gameId": gameId]
            if let password = password {
                params["password"] = password
            }
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case let .gameEngineLogin(userId):
            let params: [String: Any] = ["userId": userId]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case let .fastJoin(gameId):
            let params: [String: Any] = ["gameId": gameId]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case let .switchGame(gameId, gameState, roomId):
            let params: [String: Any] = ["gameId": gameId, "gameStatus": gameState, "roomId": roomId]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case let .gameStatus(gameId, gameState, roomId):
            let params: [String: Any] = ["gameId": gameId, "gameStatus": gameState, "roomId": roomId]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        }
    }
}

