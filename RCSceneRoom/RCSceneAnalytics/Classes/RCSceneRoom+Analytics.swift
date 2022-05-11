//
//  RCSceneRoom+Analytics.swift
//  RCSceneRoom
//
//  Created by shaoshuai on 2022/5/9.
//

import Foundation

public var appVersion: String {
    guard let info = Bundle.main.infoDictionary else {
        return ""
    }
    return info["CFBundleShortVersionString"] as? String ?? ""
}

public extension RCSceneRoom {
    var sceneName: String {
        if roomType == 1 {
            return "语聊房"
        }
        if roomType == 2 {
            return "语音电台"
        }
        if roomType == 3 {
            return "视频直播"
        }
        return "语聊房"
    }
}
