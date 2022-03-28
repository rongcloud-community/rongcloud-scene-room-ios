
import Foundation

public protocol RCSceneRoomUserOperationProtocol: AnyObject {
    func kickUserOffSeat(seatIndex: UInt)
    func lockSeatDidClick(isLock: Bool, seatIndex: UInt)
    func muteSeat(isMute: Bool, seatIndex: UInt)
    func kickOutRoom(userId: String)
    func didSetManager(userId: String, isManager: Bool)
    func didClickedPrivateChat(userId: String)
    func didClickedSendGift(userId: String)
    func didClickedInvite(userId: String)
    func didFollow(userId: String, isFollow: Bool)
}

public extension RCSceneRoomUserOperationProtocol {
    func kickUserOffSeat(seatIndex: UInt) {}
    func lockSeatDidClick(isLock: Bool, seatIndex: UInt) {}
    func muteSeat(isMute: Bool, seatIndex: UInt) {}
    func kickOutRoom(userId: String) {}
    func didSetManager(userId: String, isManager: Bool) {}
    func didClickedPrivateChat(userId: String) {}
    func didClickedSendGift(userId: String) {}
    func didClickedInvite(userId: String) {}
    func didFollow(userId: String, isFollow: Bool) {}
}
