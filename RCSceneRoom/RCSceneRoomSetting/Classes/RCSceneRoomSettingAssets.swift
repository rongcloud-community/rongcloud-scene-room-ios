//
//  RCSceneAssets.swift
//  Alamofire
//
//  Created by shaoshuai on 2022/3/24.
//

import UIKit

class RCSceneRoomSettingBundle: Bundle {
    static var image: Bundle? {
        let libURL = Bundle(for: RCSceneRoomSettingBundle.self).bundleURL
        let imageURL = libURL.appendingPathComponent("RCSceneRoomSetting.bundle")
        return RCSceneRoomSettingBundle(url: imageURL)
    }
}

extension UIImage {
    convenience init?(roomSetting: String) {
        guard let bundle = RCSceneRoomSettingBundle.image else { return nil }
        if #available(iOS 13.0, *) {
            self.init(named: roomSetting, in: bundle, with: nil)
        } else {
            self.init(named: roomSetting)
        }
    }
}
