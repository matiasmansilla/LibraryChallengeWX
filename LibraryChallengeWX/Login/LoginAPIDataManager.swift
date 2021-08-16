//
//  LoginAPIDataManager.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//

import Alamofire
import ObjectMapper

class LoginAPIDataManager: LoginAPIDataManagerProtocol {
  
  
  // MARK: - Properties
  var network: NetworkingProtocol = Networking(apiManager: APIManager())
  // MARK: - Methods
  func login(user: User, completion: @escaping (LoginResponse?, AFError?) -> Void) {
    network.execute(Endpoint.signin, parameters: user.dictionary, completion: completion)
  }
}
