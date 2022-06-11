//
//  UIView+Extension.swift
//  RCSceneRoomSettingKit
//
//  Created by shaoshuai on 2022/1/26.
//

import UIKit

public extension UIView {
    var x: CGFloat {
        get { return self.frame.origin.x }
        set { self.frame.origin.x = newValue }
    }
    
    var y: CGFloat {
        get { return self.frame.origin.y }
        set { self.frame.origin.y = newValue }
    }
    
    var bottomY: CGFloat {
        get { return self.frame.origin.y + self.frame.size.height }
        set { self.frame.origin.y = newValue - self.frame.size.height }
    }
    
    var width: CGFloat {
        get { return self.frame.size.width }
        set { self.frame.size.width = newValue }
    }
    
    var height: CGFloat {
        get { return self.frame.size.height }
        set { self.frame.size.height = newValue }
    }
    
    var controller: UIViewController? {
        var tmp = next
        while let responder = tmp {
            if responder.isKind(of: UIViewController.self) {
                return responder as? UIViewController
            }
            tmp = tmp?.next
        }
        return nil
    }
}

public extension UIView {
    static func autoSize() -> CGSize {
        let size = UIView.layoutFittingCompressedSize
        return self.init().systemLayoutSizeFitting(size)
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

/// MUST: UIViewController.UIView
public extension UIView {
    func enableTapEndEditing(_ index: Int = 0) {
        let tapView = UIView(frame: bounds)
        tapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(tapView, at: index)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onEndEditingTap))
        tapView.addGestureRecognizer(gesture)
    }
    
    func enableTapEndEditing(above view: UIView) {
        let tapView = UIView(frame: bounds)
        tapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(tapView, aboveSubview: view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onEndEditingTap))
        tapView.addGestureRecognizer(gesture)
    }
    
    func enableTapEndEditing(below view: UIView) {
        let tapView = UIView(frame: bounds)
        tapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(tapView, belowSubview: view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(onEndEditingTap))
        tapView.addGestureRecognizer(gesture)
    }
    
    @objc private func onEndEditingTap() {
        endEditing(true)
    }
}

public extension UIView {
    func popMenuClip(corners: UIRectCorner,
                     cornerRadius: CGFloat,
                     centerCircleRadius: CGFloat) {
        let roundCornerBounds = CGRect(x: 0, y: centerCircleRadius, width: bounds.size.width, height: bounds.size.height - centerCircleRadius)
        let path = UIBezierPath(roundedRect: roundCornerBounds, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: (bounds.size.width/2) - centerCircleRadius, y: 0, width: centerCircleRadius * 2, height: centerCircleRadius * 2))
        path.append(ovalPath)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
