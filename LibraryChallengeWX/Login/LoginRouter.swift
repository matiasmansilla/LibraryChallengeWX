//
//  LoginRouter.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//
import UIKit

class LoginRouter: LoginRouterProtocol {
  // MARK: - Methods
  
  func instantiate() -> LoginViewController {
    let view = LoginViewController.instantiate()
    let presenter: LoginPresenterProtocol = LoginPresenter()
    let interactor: LoginInteractorProtocol = LoginInteractor()
    let apiDataManager: LoginAPIDataManagerProtocol = LoginAPIDataManager()
    ///Connections
    view.presenter = presenter
    presenter.view = view
    presenter.router = self
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.apiDataManager = apiDataManager
    return view
  }
  
  func goToInitialView() {
    if SessionHelper.shared.isSessionStored() {
      goToMainTab()
    } else {
      goToLogin()
    }
  }
  
  func goToLogin() {
    let view = instantiate()
    guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
    window.rootViewController = view
    UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {}, completion: nil)
  }
  
  func goToMainTab() {
    let view = MainTabBarRouter().instantiate()
    guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
    window.rootViewController = view
    UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {}, completion: nil)
  }
  
  func presentError(from context: AnyObject?, with title: String?, message: String?) {
    guard let context = context as? UIViewController else { return }
    GenericErrorRouter().showGenericError(from: context, title: title, message: message) {
      context.hideLoadingOverlay()
    }
  }
}
