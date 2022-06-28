
import Foundation

public struct User: Identifiable, Codable {
    public let userId: String
    public let userName: String
    public let portrait: String?
    public var imToken: String
    public let authorization: String
    public let type: Int
    
    public init(userId: String,
                userName: String,
                portrait: String?,
                imToken: String,
                authorization: String,
                type: Int) {
        self.userId = userId
        self.userName = userName
        self.portrait = portrait
        self.imToken = imToken
        self.authorization = authorization
        self.type = type
    }
    
    public func update(name: String, portrait: String) -> User {
        return User(userId: userId,
                    userName: name,
                    portrait: portrait,
                    imToken: imToken,
                    authorization: authorization,
                    type: type)
    }
    
    public var id: String {
        return userId
    }
}

public struct RCSceneRoomUser: Codable, Equatable {
    public let userId: String
    public let userName: String
    public let portrait: String?
    public let status: Int?
    public let sex: String?
    
    public var isFollow: Bool {
        return status == 1
    }
    
    public var relation: Int?
    public mutating func set(_ relation: Int) {
        self.relation = relation
    }
    
    public init(userId: String,
                userName: String,
                portrait: String?,
                status: Int?,
                sex: String?) {
        self.userId = userId
        self.userName = userName
        self.portrait = portrait
        self.status = status
        self.sex = sex
    }
}
