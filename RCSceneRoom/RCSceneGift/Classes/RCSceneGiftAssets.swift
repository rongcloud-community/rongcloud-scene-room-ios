//
//  RCSceneAssets.swift
//  Alamofire
//
//  Created by shaoshuai on 2022/3/24.
//

import UIKit

class RCSceneBundle: Bundle {
    static var image: Bundle? {
        let libURL = Bundle(for: RCSceneBundle.self).bundleURL
        let imageURL = libURL.appendingPathComponent("RCSceneGift.bundle")
        return RCSceneBundle(url: imageURL)
    }
}

extension UIImage {
    convenience init?(assetName: String) {
        guard let bundle = RCSceneBundle.image else { return nil }
        if #available(iOS 13.0, *) {
            self.init(named: assetName, in: bundle, with: nil)
        } else {
            self.init(named: assetName)
        }
    }
}
