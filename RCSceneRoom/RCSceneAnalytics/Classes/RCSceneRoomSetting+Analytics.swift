//
//  RCSceneRoomSetting+Analytics.swift
//  RCSceneRoom
//
//  Created by shaoshuai on 2022/5/9.
//

import Foundation

extension Item {
    var functionId: Int {
        switch self {
        case .roomLock:
            return 1
        case .roomSuspend:
            return 2
        case .roomName:
            return 3
        case .roomNotice:
            return 4
        case .roomBackground:
            return 5
        case .music:
            return 6
        case .forbidden:
            return 7
        case .seatMute:
            return 8
        case .seatLock:
            return 9
        case .seatFree:
            return 10
        case .seatCount:
            return 11
        case .speaker:
            return 12
        case .cameraSetting:
            return 13
        case .cameraSwitch:
            return 14
        case .beautyRetouch:
            return 15
        case .beautySticker:
            return 16
        case .beautyMakeup:
            return 17
        case .beautyEffect:
            return 18
        }
    }
}
