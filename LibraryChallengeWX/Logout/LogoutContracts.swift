//
//  LogoutContracts.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 17/08/2021.
//

import UIKit
import Foundation
// MARK: - Presenter Protocol
protocol LogoutPresenterProtocol: class {
  var view: LogoutViewProtocol? { get set }
  var interactor: LogoutInteractorProtocol? { get set }
  var router: LogoutRouterProtocol? { get set }
  func logout()
}
// MARK: - View Protocol
protocol LogoutViewProtocol: class {
  var presenter: LogoutPresenterProtocol? { get set }

}
// MARK: - Interactor Protocol
protocol LogoutInteractorProtocol: class {
  var presenter: LogoutPresenterProtocol? { get set }
  var apiDataManager: LogoutAPIDataManagerProtocol? { get set }

}
// MARK: - Router Protocol
protocol LogoutRouterProtocol: class {
  func instantiate() -> LogoutViewController
  func goToLogout(from context: AnyObject?)
  func presentLogoutSuccessful(from context: AnyObject?, with title: String?, message: String?)
}
// MARK: - API Data Manager Protocol
protocol LogoutAPIDataManagerProtocol: class {
  var network: NetworkingProtocol { get set }
}







