//
//  RCSServiceType.swift
//  RCE
//
//  Created by xuefeng on 2022/1/28.
//

import Foundation

public extension RCSServiceType {
    var baseURL: URL {
        return Environment.url
    }
    var headers: [String : String]? {
        var header = [String: String]()
        if let auth = UserDefaults.standard.authorizationKey() {
            header["Authorization"] = auth
        }
        header["BusinessToken"] = Environment.businessToken
        return header
    }
}
