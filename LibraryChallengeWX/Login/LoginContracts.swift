//
//  LoginContracts.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//

import UIKit
import Alamofire

// MARK: - Presenter Protocol
protocol LoginPresenterProtocol: class {
  var view: LoginViewProtocol? { get set }
  var interactor: LoginInteractorProtocol? { get set }
  var router: LoginRouterProtocol? { get set }
  func login(with user: User)

}
// MARK: - View Protocol
protocol LoginViewProtocol: class {
  var presenter: LoginPresenterProtocol? { get set }

}
// MARK: - Interactor Protocol
protocol LoginInteractorProtocol: class {
  var presenter: LoginPresenterProtocol? { get set }
  var apiDataManager: LoginAPIDataManagerProtocol? { get set }
  func loginAPI(user: User)
}
// MARK: - Router Protocol
protocol LoginRouterProtocol: class {
  func goToLogin(window: AnyObject?)

}
// MARK: - API Data Manager Protocol
protocol LoginAPIDataManagerProtocol: class {
  var network: NetworkingProtocol { get set }
  func login(user: User, completion: @escaping (_ response: LoginResponse?, _ error: AFError?) -> Void)

}







