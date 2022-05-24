
import Foundation

public typealias RCSUMCallback = (RCSceneRoomUser) -> Void

public class RCSceneUserManager {
    public static let shared = RCSceneUserManager()
    
    private var downloadingUser = [String: [RCSUMCallback]]()
    private var cachedUser = [String: RCSceneRoomUser]()
    
    public func refreshUserInfo(userId: String, completion: @escaping RCSUMCallback) {
        if let _ = cachedUser[userId] {
            cachedUser.removeValue(forKey: userId)
        }
        let api = RCUserService.usersInfo(id: [userId])
        userProvider.request(api) { result in
            switch result.map(RCSceneWrapper<[RCSceneRoomUser]>.self) {
            case let .success(wrapper):
                guard let list = wrapper.data else {return}
                for user in list {
                    self.cachedUser[user.userId] = user
                    completion(user)
                }
            case let .failure(error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    public func fetchUserInfo(userId: String, completion: @escaping RCSUMCallback) {
        if let user = cachedUser[userId] {
            completion(user)
            return
        }
        if var completions = downloadingUser[userId] {
            completions.append(completion)
            downloadingUser[userId] = completions
            return
        }
        downloadingUser[userId] = [completion]
        let api = RCUserService.usersInfo(id: [userId])
        userProvider.request(api) { result in
            switch result.map(RCSceneWrapper<[RCSceneRoomUser]>.self) {
            case let .success(wrapper):
                guard let list = wrapper.data else {return}
                for user in list {
                    self.cachedUser[user.userId] = user
                    self.downloadingUser[userId]?.forEach({ completion in
                        completion(user)
                    })
                    self.downloadingUser.removeValue(forKey: userId)
                }
            case .failure:
                self.downloadingUser.removeValue(forKey: userId)
            }
        }
    }
    
    public func fetch(_ userIds: [String], completion: @escaping ([RCSceneRoomUser]) -> Void) {
        let users = userIds.compactMap { cachedUser[$0] }
        if users.count == userIds.count {
            return completion(users)
        }
        let ids = userIds.filter { cachedUser[$0] == nil }
        let api = RCUserService.usersInfo(id: ids)
        userProvider.request(api) { result in
            switch result.map(RCSceneWrapper<[RCSceneRoomUser]>.self) {
            case let .success(wrapper):
                let list = wrapper.data ?? []
                list.forEach { self.cachedUser[$0.userId] = $0 }
                if users.count + list.count == userIds.count {
                    completion(userIds.compactMap { self.cachedUser[$0] })
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    public func updateLocalCache(_ user: RCSceneRoomUser) {
        cachedUser[user.userId] = user
    }
}
