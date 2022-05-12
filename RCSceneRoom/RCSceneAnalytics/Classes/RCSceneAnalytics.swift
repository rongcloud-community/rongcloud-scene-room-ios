//
//  RCSceneAssets.swift
//  Alamofire
//
//  Created by shaoshuai on 2022/3/24.
//

import SensorsAnalyticsSDK

public class RCSensor {
    
    public static let shared = SensorsAnalyticsSDK.sharedInstance()
    
    public static func start(_ serverURL: String,
                             launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        let options = SAConfigOptions(serverURL: serverURL,
                                      launchOptions: launchOptions)
        options.autoTrackEventType = [
            .eventTypeAppStart,
            .eventTypeAppEnd,
            .eventTypeAppClick,
            .eventTypeAppViewScreen
        ]
        options.setValue(true, forKey: "enableTrackAppCrash")
        #if DEBUG
        options.enableLog = true
        #endif
        SensorsAnalyticsSDK.start(configOptions: options)
        
        SensorsAnalyticsSDK.sharedInstance()?.registerSuperProperties([
            "platform_type": "iOS",
            "app_type": "RCRTC国内版",
            "demo_type_id": "1",
            "demo_version": appVersion,
            "company_name": ""
        ])
        
        SensorsAnalyticsSDK.sharedInstance()?.registerDynamicSuperProperties({
            ["is_login": UserDefaults.standard.rongToken() != nil]
        })
        
        SensorsAnalyticsSDK.sharedInstance()?.trackAppInstall()
    }
}

public enum RCSensorAction {
    case codeClick
    case code(Result<Void, NetError>)
    case loginClick
    case login(Result<Void, NetError>)
    case joinRoom(_ room: RCSceneRoom, enableMic: Bool, enableCamera: Bool)
    case quitRoom(_ room: RCSceneRoom, enableMic: Bool, enableCamera: Bool)
    case createRoom(_ room: RCSceneRoom, enableMic: Bool, enableCamera: Bool)
    case closeRoom(_ room: RCSceneRoom, enableMic: Bool, enableCamera: Bool)
    case connectRequest(_ room: RCSceneRoom)
    case connectionWithDraw(_ room: RCSceneRoom)
    case PKClick(_ room: RCSceneRoom)
    case textClick(_ room: RCSceneRoom)
    case giftClick(_ room: RCSceneRoom)
    case settingClick(_ room: RCSceneRoom, item: Item)
    case dialClick(_ type: Int)
    case functionModuleView(_ name: String)
}

public extension RCSensorAction {
    func trigger() {
        switch self {
        case .codeClick:
            RCSensor.shared?.track("getCodeClick", withProperties: ["service_type": "登录"])
        case let .code(result):
            var properties: [String: Any] = [
                "service_type": "登录"
            ]
            switch result {
            case .success:
                properties["is_success"] = true
            case let .failure(error):
                properties["is_success"] = false
                properties["fail_reason"] = error.localizedDescription
            }
            RCSensor.shared?.track("getCodeResult", withProperties: properties)
        case .loginClick:
            RCSensor.shared?.track("loginButtonClick", withProperties: [
                "current_page": "demo登录页",
                "login_method": "验证码登录"
            ])
        case let .login(result):
            let isFirst = !UserDefaults.standard.bool(forKey: "is_first_time_occur")
            var properties: [String: Any] = [
                "login_method": "验证码登录",
                "is_first_time_occur": isFirst,
            ]
            switch result {
            case .success:
                properties["is_success"] = true
            case let .failure(error):
                properties["is_success"] = false
                properties["fail_reason"] = error.localizedDescription
            }
            UserDefaults.standard.set(true, forKey: "is_first_time_occur")
            RCSensor.shared?.track("getLogin", withProperties: properties)
            RCSensor.shared?.registerDynamicSuperProperties {
                ["isLogin": true]
            }
        case let .joinRoom(room, mic, camera):
            let ps: [String: Any] = [
                "room_id": room.roomId,
                "room_name": room.roomName,
                "is_private": room.isPrivate,
                "is_speaker_on": mic,
                "is_camera_on": camera,
                "scenes": room.sceneName,
            ]
            RCSensor.shared?.track("joinRoom", withProperties: ps)
        case let .quitRoom(room, mic, camera):
            let ps: [String: Any] = [
                "room_id": room.roomId,
                "room_name": room.roomName,
                "is_private": room.isPrivate,
                "is_speaker_on": mic,
                "is_camera_on": camera,
                "scenes": room.sceneName,
            ]
            RCSensor.shared?.track("quitRoom", withProperties: ps)
        case let .createRoom(room, mic, camera):
            let ps: [String: Any] = [
                "room_id": room.roomId,
                "room_name": room.roomName,
                "is_private": room.isPrivate,
                "is_speaker_on": mic,
                "is_camera_on": camera,
                "scenes": room.sceneName,
            ]
            RCSensor.shared?.track("createRoom", withProperties: ps)
        case let .closeRoom(room, mic, camera):
            let ps: [String: Any] = [
                "room_id": room.roomId,
                "room_name": room.roomName,
                "is_private": room.isPrivate,
                "is_speaker_on": mic,
                "is_camera_on": camera,
                "scenes": room.sceneName,
            ]
            RCSensor.shared?.track("closeRoom", withProperties: ps)
        case let .connectRequest(room):
            let ps: [String: Any] = [
                "room_id": room.roomId,
                "room_name": room.roomName,
                "scenes": room.sceneName,
            ]
            RCSensor.shared?.track("connectRequest", withProperties: ps)
        case let .connectionWithDraw(room):
            let ps: [String: Any] = [
                "room_id": room.roomId,
                "room_name": room.roomName,
                "scenes": room.sceneName,
            ]
            RCSensor.shared?.track("connectionWithDraw", withProperties: ps)
        case let .PKClick(room):
            let ps: [String: Any] = [
                "room_id": room.roomId,
                "room_name": room.roomName,
                "scenes": room.sceneName,
            ]
            RCSensor.shared?.track("pkClick", withProperties: ps)
        case let .textClick(room):
            let ps: [String: Any] = [
                "room_id": room.roomId,
                "room_name": room.roomName,
                "scenes": room.sceneName,
            ]
            RCSensor.shared?.track("textClick", withProperties: ps)
        case let .giftClick(room):
            let ps: [String: Any] = [
                "room_id": room.roomId,
                "room_name": room.roomName,
                "scenes": room.sceneName,
            ]
            RCSensor.shared?.track("giftClick", withProperties: ps)
        case let .settingClick(room, item):
            let ps: [String: Any] = [
                "room_id": room.roomId,
                "room_name": room.roomName,
                "setting_function": item.title,
                "setting_function_id": "\(item.functionId)",
                "scenes": room.sceneName,
            ]
            RCSensor.shared?.track("settingClick", withProperties: ps)
        case let .dialClick(type):
            let ps: [String: Any] = [
                "scenes": type == 1 ? "视频通话" : "音频通话"
            ]
            RCSensor.shared?.track("dailClick", withProperties: ps)
        case let .functionModuleView(name):
            let ps: [String: Any] = [
                "module_name": name,
            ]
            RCSensor.shared?.track("functionModuleView", withProperties: ps)
        }
    }
}
