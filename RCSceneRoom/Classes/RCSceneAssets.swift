//
//  RCSCBundle.swift
//  Alamofire
//
//  Created by shaoshuai on 2022/3/24.
//

import UIKit

class RCSCBundle: Bundle {
    static var bundleURL: URL {
        let bundleURL = Bundle(for: RCSCBundle.self).bundleURL
        return bundleURL.appendingPathComponent("RCSceneCommunity.bundle")
    }

    static var sharedBundle: RCSCBundle? {
        let url = bundleURL
        return RCSCBundle(url: url)
    }
}
