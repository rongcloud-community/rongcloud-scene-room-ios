//
//  UIWindow+Compatible.swift
//  RCSceneRoom
//
//  Created by johankoi on 2022/5/31.
//

import UIKit

public extension UIWindow {
//    compatible
    static var compatibleKeyWindow: UIWindow? {
           if #available(iOS 13, *) {
//               let keyWindow = UIApplication.shared.connectedScenes
//                       .filter({$0.activationState == .foregroundActive})
//                       .compactMap({$0 as? UIWindowScene})
//                       .first?.windows
//                       .filter({$0.isKeyWindow}).first
               return UIApplication.shared.windows.first { $0.isKeyWindow }
           } else {
               return UIApplication.shared.keyWindow
           }
       }
}
