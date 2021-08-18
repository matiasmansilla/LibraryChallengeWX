import Foundation
class MainTabBarAPIDataManager: MainTabBarAPIDataManagerProtocol {
  // MARK: - Properties
  var network: NetworkingProtocol = Networking(apiManager: APIManager())
  // MARK: - Methods
}
