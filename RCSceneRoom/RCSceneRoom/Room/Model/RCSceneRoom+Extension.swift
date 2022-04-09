//
//  RCSceneRoom+Extension.swift
//  RCSceneRoom
//
//  Created by shaoshuai on 2022/3/29.
//

import Foundation

public extension RCSceneRoom {
    var switchable: Bool {
        return isPrivate == 0 && userId != Environment.currentUserId
    }
    
    var isOwner: Bool {
        return userId == Environment.currentUserId
    }
}
