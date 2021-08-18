//
//  LogoutRouter.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 17/08/2021.
//
import UIKit

class LogoutRouter: LogoutRouterProtocol {
  // MARK: - Methods
  func instantiate() -> LogoutViewController {
    let view = LogoutViewController.instantiate()
    let presenter: LogoutPresenterProtocol = LogoutPresenter()
    let interactor: LogoutInteractorProtocol = LogoutInteractor()
    let router: LogoutRouterProtocol = LogoutRouter()
    let apiDataManager: LogoutAPIDataManagerProtocol = LogoutAPIDataManager()
    ///Connections
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.apiDataManager = apiDataManager
    
    return view
  }
  
  func goToLogout(from context: AnyObject?) {
    guard let context = context as? UIViewController else { return }
    let view = instantiate()
    ///Navigation
    context.navigationController?.pushViewController(view, animated: true)
  }
  
  func presentLogoutSuccessful(from context: AnyObject?, with title: String?, message: String?) {
    guard let context = context as? UIViewController else { return }
    GenericErrorRouter().showGenericError(from: context, title: title, message: message) {
      SessionHelper.shared.deleteSession()
      LoginRouter().goToInitialView()
    }
  }
  
  }


