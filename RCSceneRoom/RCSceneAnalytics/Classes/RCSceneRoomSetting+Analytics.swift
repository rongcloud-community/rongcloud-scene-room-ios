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
        case .roomLock(let bool):
            return 1
        case .roomSuspend(let bool):
            return 2
        case .roomName(let string):
            return 3
        case .roomNotice(let string):
            return 4
        case .roomBackground:
            return 5
        case .music:
            return 6
        case .forbidden(let array):
            return 7
        case .seatMute(let bool):
            return 8
        case .seatLock(let bool):
            return 9
        case .seatFree(let bool):
            return 10
        case .seatCount(let int):
            return 11
        case .speaker(let enable):
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
