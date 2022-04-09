//
//  MessageHandlerManager.swift
//  RCE
//
//  Created by xuefeng on 2022/1/24.
//

import UIKit

public let RCSceneMusicInfoSyncKey              = "RCVoiceSyncMusicInfoKey"
public let RCSceneSMObjectNameKey               = "RCMic:shumeiAuditFreezeMsg"

public protocol RoomMessageHandlerProtocol {
    static func handleMessage(message: RCMessage?, object: AnyObject?)
}

public class RoomMessageHandlerManager {
    
    static var handlers = Array<AnyClass>()
    
    static let queue = DispatchQueue(label: "message_handler_queue",attributes: .concurrent)

    public static func registerMessageHandler(_ handler: AnyClass) {
        queue.async(group: nil, qos: .default, flags: .barrier) {
            handlers.append(handler);
        }
    }
    
    public static func handleMessage(_ message: RCMessage?, _ object: AnyObject?) {
        for handler in handlers {
            guard let handler = handler as? RoomMessageHandlerProtocol.Type else {
                continue
            }
            queue.async {
                handler.handleMessage(message: message, object: object)
            }
        }
    }
}