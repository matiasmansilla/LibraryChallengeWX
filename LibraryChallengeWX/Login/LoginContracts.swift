//
//  LoginContracts.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//

import UIKit
import Foundation
// MARK: - Presenter Protocol
protocol LoginPresenterProtocol: class {
  var view: LoginViewProtocol? { get set }
  var interactor: LoginInteractorProtocol? { get set }
  var router: LoginRouterProtocol? { get set }

}
// MARK: - View Protocol
protocol LoginViewProtocol: class {
  var presenter: LoginPresenterProtocol? { get set }

}
// MARK: - Interactor Protocol
protocol LoginInteractorProtocol: class {
  var presenter: LoginPresenterProtocol? { get set }
  var apiDataManager: LoginAPIDataManagerProtocol? { get set }

}
// MARK: - Router Protocol
protocol LoginRouterProtocol: class {
  func goToLogin(window: AnyObject?)

}
// MARK: - API Data Manager Protocol
protocol LoginAPIDataManagerProtocol: class {
  var network: NetworkingProtocol { get set }
}







