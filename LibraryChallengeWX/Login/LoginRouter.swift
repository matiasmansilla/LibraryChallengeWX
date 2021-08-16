//
//  LoginRouter.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//
import UIKit

class LoginRouter: LoginRouterProtocol {
  
  // MARK: - Methods
  func goToLogin(window: AnyObject?) {
    let view = LoginViewController.instantiate()
    let presenter: LoginPresenterProtocol = LoginPresenter()
    let interactor: LoginInteractorProtocol = LoginInteractor()
    let apiDataManager: LoginAPIDataManagerProtocol = LoginAPIDataManager()
    let navigationController = UINavigationController(rootViewController: view)
    setupNavigationBar(navigationController)
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
  
  func presentError(from context: AnyObject?, with title: String?, message: String?) {
    guard let context = context as? UIViewController else { return }
    GenericErrorRouter().showGenericError(from: context, title: title, message: message) {
      context.hideLoadingOverlay()
    }
  }
  
  func goToBookList(from context: AnyObject?) {
    guard let context = context as? UIViewController else { return }
    context.hideLoadingOverlay()
    BookListRouter().goToBookList(from: context)
  }
  
  private func setupNavigationBar(_ navi: UINavigationController) {
    let image = UIImage(named: "bc_nav bar")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch)
    navi.navigationBar.shadowImage = UIImage()
    navi.navigationBar.setBackgroundImage(image, for: .default)
    
    navi.navigationBar.barStyle = .black
    
    navi.navigationBar.tintColor = .white
    
    navi.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }
}
