//
//  LoginAPIDataManager.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//

import Foundation
class LoginAPIDataManager: LoginAPIDataManagerProtocol {
  // MARK: - Properties
  var network: NetworkingProtocol = Networking(apiManager: APIManager())
  // MARK: - Methods
}
