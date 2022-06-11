//
//  RCBroadcastManager.swift
//  RCE
//
//  Created by shaoshuai on 2021/8/23.
//

import UIKit

fileprivate let kRCBroadcastDuration: TimeInterval = 5

public class RCBroadcastManager: NSObject {
    public static let shared = RCBroadcastManager()
    
    public weak var delegate: RCRTCBroadcastDelegate?
    
    private(set) lazy var messages = [RCGiftBroadcast]() {
        didSet {
            guard
                oldValue.count == 0,
                messages.count > 0,
                currentView == nil
            else { return }
            displayNext()
        }
    }
    public var currentView: RCRTCGiftBroadcastView?
    public var currentClickedRoom: RCSceneRoom?
    
    public func add(_ message: RCGiftBroadcastMessage) {
        guard let content = message.content else { return }
        messages.append(content)
    }
    
    private func displayNext() {
        guard messages.count > 0 else { return }
        currentView = RCRTCGiftBroadcastView(messages.removeFirst(), delegate: self)
        currentView?.alpha = 0
        DispatchQueue.main.async { [unowned self] in
            UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseInOut) {
                self.currentView?.alpha = 1
            } completion: { _ in }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + kRCBroadcastDuration) { [unowned self] in
            UIView.animate(withDuration: 0.3) {
                self.currentView?.alpha = 0
            } completion: { _ in
                self.currentView?.removeFromSuperview()
                self.currentView = nil
                self.displayNext()
            }
        }
        delegate?.broadcastViewDidLoad(currentView!)
    }
}

extension RCBroadcastManager: RCRTCBroadcastDelegate {
    public func broadcastViewDidLoad(_ view: RCRTCGiftBroadcastView) {
        delegate?.broadcastViewDidLoad(view)
    }
    
    public func broadcastViewWillAppear(_ view: RCRTCGiftBroadcastView) {
        view.alpha = 0
        UIView.animate(withDuration: 0.3) {
            view.alpha = 1
        }
    }
    
    public func broadcastViewAccessible(_ room: RCSceneRoom) -> Bool {
        delegate?.broadcastViewAccessible(room) ?? false
    }
    
    public func broadcastViewDidClick(_ room: RCSceneRoom) {
        currentClickedRoom = room
        delegate?.broadcastViewDidClick(room)
    }
}
