//
//  LogoutPresenter.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 17/08/2021.
//
import Foundation

class LogoutPresenter: LogoutPresenterProtocol {
  // MARK: - Properties
  weak var view: LogoutViewProtocol?
  var interactor: LogoutInteractorProtocol?
  var router: LogoutRouterProtocol?
  // MARK: - Methods
  func logout() {
    router?.presentLogoutSuccessful(from: view, with: "Success", message: "You have successfully loged out")
  }
}

