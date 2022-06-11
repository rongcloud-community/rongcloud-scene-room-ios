//
//  AppEnvironment.swift
//  RCE
//
//  Created by 叶孤城 on 2021/4/19.
//

import Foundation

public struct Environment {
    public static var url: URL = URL(string: "https://xxx/")!
    
    public static var rcKey: String = ""
    
    /// 请申请您的 BusinessToken：https://rcrtc-api.rongcloud.net/code
    public static var businessToken: String  = ""
}

public extension Environment {
    static var currentUserId: String {
        return UserDefaults.standard.loginUser()?.userId ?? ""
    }

    static var currentUser: User? {
        return UserDefaults.standard.loginUser()
    }
}
