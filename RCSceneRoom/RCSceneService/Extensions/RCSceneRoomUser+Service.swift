//
//  RCSceneRoomUser+Service.swift
//  RCSceneRoom
//
//  Created by shaoshuai on 2022/5/24.
//

import Foundation

extension User {
    public var portraitUrl: String {
        return Environment.url.absoluteString + "file/show?path=" + (portrait ?? "")
    }
}

extension RCSceneRoomUser {
    public var portraitUrl: String {
        if let portrait = portrait, portrait.count > 0 {
            return Environment.url.absoluteString + "file/show?path=" + portrait
        }
        return "https://cdn.ronghub.com/demo/default/rce_default_avatar.png"
    }
}
