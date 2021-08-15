//
//  LoginRouter.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//
import UIKit

class LoginRouter: LoginRouterProtocol {
  
  func goToLogin(window: AnyObject?) {
    let view = LoginViewController.instantiate()
    let presenter: LoginPresenterProtocol = LoginPresenter()
    let interactor: LoginInteractorProtocol = LoginInteractor()
    let apiDataManager: LoginAPIDataManagerProtocol = LoginAPIDataManager()
    let navigationController = UINavigationController(rootViewController: view)
    
    navigationController.navigationBar.barStyle = .black
    
    guard let window = window as? UIWindow else { return }
    window.rootViewController = navigationController
    ///Connections
    view.presenter = presenter
    presenter.view = view
    presenter.router = self
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.apiDataManager = apiDataManager
  }
  
  // MARK: - Methods
}
