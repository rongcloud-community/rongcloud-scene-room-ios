//
//  RCSceneRoomPasswordProtocol.swift
//  RCSceneRoom
//
//  Created by shaoshuai on 2022/3/28.
//

import Foundation

public protocol RCSceneRoomPasswordProtocol: AnyObject {
    func passwordDidEnter(password: String)
    func passwordDidVerify(_ room: RCSceneRoom)
}

public extension RCSceneRoomPasswordProtocol {
    func passwordDidEnter(password: String) {}
    func passwordDidVerify(_ room: RCSceneRoom) {}
}
