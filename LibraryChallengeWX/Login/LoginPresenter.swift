//
//  LoginPresenter.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//
import Foundation

class LoginPresenter: LoginPresenterProtocol {
  // MARK: - Properties
  weak var view: LoginViewProtocol?
  var interactor: LoginInteractorProtocol?
  var router: LoginRouterProtocol?
  // MARK: - Methods
  func login(with user: User) {
    interactor?.loginAPI(user: user)
  }
  
  func setError(title: String?, message: String?) {
    router?.presentError(from: view, with: title, message: message)
  }
  
  func navigateToMainTabBar() {
    router?.goToMainTab()
  }
}
