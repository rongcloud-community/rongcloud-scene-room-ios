
import Foundation

public protocol RCRoomCycleProtocol where Self: UIViewController {
    /// 离开房间
    func leaveRoom(_ completion: @escaping (Result<Void, RCSceneError>) -> Void)
    
    /// 禁用滚动事件的视图
    func descendantViews() -> [UIView]
    
}

extension RCRoomCycleProtocol {
    public func leaveRoom(_ completion: @escaping (Result<Void, RCSceneError>) -> Void) {}
    public func descendantViews() -> [UIView] { [] }
}

