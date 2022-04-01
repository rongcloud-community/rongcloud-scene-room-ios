//
//  RoomSettingView.swift
//  RCE
//
//  Created by 叶孤城 on 2021/5/6.
//

import UIKit

public enum Item {
    case roomLock(Bool)
    case roomSuspend(Bool)
    case roomName(String)
    case roomNotice(String)
    case roomBackground
    
    case music
    case forbidden([String])
    
    case seatMute(Bool)
    case seatLock(Bool)
    case seatFree(Bool)
    case seatCount(Int)
    
    case speaker(enable: Bool)
    
    case cameraSetting
    case cameraSwitch
    
    case beautyRetouch
    case beautySticker
    case beautyMakeup
    case beautyEffect
}

extension Item {
    var title: String {
        switch self {
        case let .roomLock(lock): return lock ? "房间上锁" : "房间解锁"
        case let .seatMute(mute): return mute ? "全麦锁麦" : "解锁全麦"
        case let .seatLock(lock): return lock ? "全麦锁座" : "解锁全座"
        case let .speaker(enable): return enable ? "静音" : "取消静音"
        case let .seatFree(free): return free ? "自由上麦" : "申请上麦"
        case .roomName: return "房间标题"
        case .roomBackground: return "房间背景"
        case let .seatCount(count): return count == 4 ? "设置4个座位" : "设置8个座位"
        case .music: return "音乐"
        case .cameraSetting: return "视频设置"
        case .forbidden: return "屏蔽词"
        case let .roomSuspend(suspend): return suspend ? "暂停直播" : "继续直播"
        case .roomNotice: return "房间公告"
        case .cameraSwitch: return "翻转"
        case .beautyRetouch: return "美颜"
        case .beautySticker: return "贴纸"
        case .beautyMakeup: return "美妆"
        case .beautyEffect: return "特效"
        }
    }
    
    var image: UIImage? {
        switch self {
        case let .roomLock(lock):
            return lock ? UIImage(roomSetting: "room_lock_on") : UIImage(roomSetting: "room_lock_off")
        case let .seatMute(mute):
            return mute ? UIImage(roomSetting: "seat_mute_on") : UIImage(roomSetting: "seat_mute_off")
        case let .seatLock(lock):
            return lock ? UIImage(roomSetting: "seat_lock_on") : UIImage(roomSetting: "seat_lock_off")
        case let .speaker(enable):
            return enable ? UIImage(roomSetting: "speaker_mute_on") : UIImage(roomSetting: "speaker_mute_off")
        case let .seatFree(free):
            return free ? UIImage(roomSetting: "seat_mode_request") : UIImage(roomSetting: "seat_mode_free")
        case .roomName: return UIImage(roomSetting: "room_title")
        case .roomBackground: return UIImage(roomSetting: "room_background")
        case let .seatCount(count):
            return count == 4 ? UIImage(roomSetting: "seat_count_4") : UIImage(roomSetting: "seat_count_8")
        case .music: return UIImage(roomSetting: "room_music")
        case .cameraSetting: return UIImage(roomSetting: "camera_settings")
        case .forbidden: return UIImage(roomSetting: "room_forbidden")
        case .roomSuspend: return UIImage(roomSetting: "room_suspend")
        case .roomNotice: return UIImage(roomSetting: "room_notice")
        case .cameraSwitch: return UIImage(roomSetting: "camera_switch")
        case .beautyRetouch: return UIImage(roomSetting: "beauty_retouch")
        case .beautySticker: return UIImage(roomSetting: "beauty_sticker")
        case .beautyMakeup: return UIImage(roomSetting: "beauty_makeup")
        case .beautyEffect: return UIImage(roomSetting: "beauty_effect")
        }
    }
}
