//
//  UserDefaults+Extension.swift
//  RCE
//
//  Created by 叶孤城 on 2021/4/28.
//

import Foundation

private let RCTokenKey                      = "RCTokenKey"
private let RCMobileKey                     = "RCMobileKey"
private let RCAuthorizationKey              = "RCAuthorizationKey"
private let RCFeedbackCountDown             = "RCFeedbackCountDown"
private let RCFeedbackCompletion            = "RCFeedbackCompletion"
private let RCFraudProtectionTriggerDateKey = "RCFraudProtectionTriggerDateKey"
private let RCGameEngineAppCodeKey = "RCGameEngineAppCodeKey"
private let RCLoginUserKey                  = "RCLoginUserKey"

public extension UserDefaults {
    func mobile() -> String? {
        return UserDefaults.standard.string(forKey: RCMobileKey)
    }
    
    func rongToken() -> String? {
        return UserDefaults.standard.string(forKey: RCTokenKey)
    }
    
    func authorizationKey() -> String? {
        return UserDefaults.standard.string(forKey: RCAuthorizationKey)
    }
    
    func loginUser() -> User? {
        guard let data = UserDefaults.standard.data(forKey: RCLoginUserKey) else {
            return nil
        }
        return try? JSONDecoder().decode(User.self, from: data)
    }
    
    func set(mobile: String) {
        UserDefaults.standard.setValue(mobile, forKey: RCMobileKey)
    }
    
    func set(authorization: String) {
        UserDefaults.standard.setValue(authorization, forKey: RCAuthorizationKey)
    }
    
    func set(user: User?) {
        guard let data = try? JSONEncoder().encode(user) else {
            return
        }
        UserDefaults.standard.setValue(data, forKey: RCLoginUserKey)
    }
    
    func set(rongCloudToken: String) {
        UserDefaults.standard.setValue(rongCloudToken, forKey: RCTokenKey)
    }
    
    func clearLoginStatus() {
        UserDefaults.standard.removeObject(forKey: RCAuthorizationKey)
        UserDefaults.standard.removeObject(forKey: RCMobileKey)
        UserDefaults.standard.removeObject(forKey: RCTokenKey)
        UserDefaults.standard.removeObject(forKey: RCLoginUserKey)
    }
 }


public extension UserDefaults {
    
    func shouldShowFeedback() -> Bool {
        if UserDefaults.standard.bool(forKey: RCFeedbackCompletion) { return false }
        return UserDefaults.standard.integer(forKey: RCFeedbackCountDown) == 3
    }
    
    func increaseFeedbackCountdown() {
        let currentCountdown = UserDefaults.standard.integer(forKey: RCFeedbackCountDown)
        UserDefaults.standard.setValue(currentCountdown + 1, forKey: RCFeedbackCountDown)
    }
    
    func feedbackCompletion() {
        UserDefaults.standard.setValue(true, forKey: RCFeedbackCompletion)
    }
  
    func clearCountDown() {
        UserDefaults.standard.setValue(0, forKey: RCFeedbackCountDown)
    }
    
    func set(fraudProtectionTriggerDate:Date) {
        UserDefaults.standard.setValue(fraudProtectionTriggerDate, forKey: RCFraudProtectionTriggerDateKey)
    }
    
    func fraudProtectionTriggerDate() -> Date? {
        return UserDefaults.standard.value(forKey: RCFraudProtectionTriggerDateKey) as? Date
    }
    
    func gameEngineAppCode() -> String? {
        return UserDefaults.standard.string(forKey: RCGameEngineAppCodeKey)
    }
    func set(gameEngineAppCode: String) {
        UserDefaults.standard.setValue(gameEngineAppCode, forKey: RCGameEngineAppCodeKey)
    }
 }
