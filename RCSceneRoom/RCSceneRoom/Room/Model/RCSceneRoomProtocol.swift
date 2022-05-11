
import Foundation

public protocol RCRoomCycleProtocol where Self: UIViewController {
    /// 加入房间
    func joinRoom(_ completion: @escaping (Result<Void, RCSceneError>) -> Void)
    /// 离开房间
    func leaveRoom(_ completion: @escaping (Result<Void, RCSceneError>) -> Void)
    
    /// 禁用滚动事件的视图
    func descendantViews() -> [UIView]
    
    /// 设置房间容器事件
    func setRoomContainerAction(action: RCRoomContainerAction)
    
    /// 设置浮窗容器事件
    func setRoomFloatingAction(action: RCSceneRoomFloatingProtocol)
}

extension RCRoomCycleProtocol {
    public func joinRoom(_ completion: @escaping (Result<Void, RCSceneError>) -> Void) {}
    public func leaveRoom(_ completion: @escaping (Result<Void, RCSceneError>) -> Void) {}
    public func descendantViews() -> [UIView] { [] }
    public func setRoomContainerAction(action: RCRoomContainerAction) {}
    public func setRoomFloatingAction(action: RCSceneRoomFloatingProtocol) {}
}

public protocol RCRoomContainerAction where Self: UIViewController {
    /// 打开滚动功能
    func enableSwitchRoom()
    /// 关闭滚动功能
    func disableSwitchRoom()
    /// 切换房间
    func switchRoom(_ room: RCSceneRoom)
}

public protocol RCSceneRoomFloatingProtocol {
    var currentRoomId: String? { get }
    var showing: Bool { get }
    
    func show(_ controller: UIViewController, superView: UIView? ,animated: Bool)
    func hide()
    
    func setSpeakingState(isSpeaking: Bool)
}
