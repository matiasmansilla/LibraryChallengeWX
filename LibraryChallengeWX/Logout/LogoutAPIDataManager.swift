import Foundation
class LogoutAPIDataManager: LogoutAPIDataManagerProtocol {
  // MARK: - Properties
  var network: NetworkingProtocol = Networking(apiManager: APIManager())
  // MARK: - Methods
}
