//
//  LoginInteractor.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//

import Foundation

class LoginInteractor: LoginInteractorProtocol {
  
  // MARK: - Properties
  weak var presenter: LoginPresenterProtocol?
  var apiDataManager: LoginAPIDataManagerProtocol?
  // MARK: - Methods
  func loginAPI(user: User) {
    apiDataManager?.login(user: user, completion: { (response, error) in
      if let message = response?.message {
        print(message)
      } else {
        print(error)
      }
    })
  }
}
