import Foundation
class BookDetailsAPIDataManager: BookDetailsAPIDataManagerProtocol {
  // MARK: - Properties
  var network: NetworkingProtocol = Networking(apiManager: APIManager())
  // MARK: - Methods
}
