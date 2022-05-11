//
//  RCNetworkState.swift
//  RCE
//
//  Created by shaoshuai on 2021/6/4.
//

import Moya

public typealias NetError = RCSceneError

/// Response
public struct RCSceneResponse: Codable {
    public let code: Int
    public let msg: String?
    
    public func validate() -> Bool {
        return code == 10000
    }
}

/// Wrapper
public struct RCSceneWrapper<T: Codable>: Codable {
    public let code: Int
    public let msg: String?
    public let data: T?
}

/// Error
public struct RCSceneError: Error, Equatable, LocalizedError {
    public let message: String
    public init(_ message: String) {
        self.message = message
    }
    public var errorDescription: String? {
        return message
    }
}

extension RCSceneError: CustomStringConvertible {
    public var description: String {
        return message
    }
}

/// Map
extension Result where Success == Moya.Response, Failure == MoyaError {
    public func map<T: Codable>(_ type: T.Type) -> Result<T, RCSceneError> {
        switch self {
        case let .failure(error):
            return .failure(RCSceneError(error.localizedDescription))
        case let .success(response):
            do {
                let model = try JSONDecoder().decode(type, from: response.data)
                return .success(model)
            } catch {
                debugPrint("map fail: \(error.localizedDescription)")
            }
            return .failure(RCSceneError("数据解析失败"))
        }
    }
}
