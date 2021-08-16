//
//  GenericErrorPresenter.swift
//  GenericErrorViperSqueleton
//
//  Created by Dardo Matias Mansilla on 31/03/2021.
//

import Foundation

class GenericErrorPresenter: GenericErrorPresenterProtocol {
  // MARK: - Properties
  weak var view: GenericErrorViewProtocol?
  var interactor: GenericErrorInteractorProtocol?
  var router: GenericErrorRouterProtocol?
  // MARK: - Methods
  func getErrorData() {
    interactor?.getErrorData()
  }
  
  func setErrorData(with title: String, message: String) {
    view?.loadErrorData(with: title, message: message)
  }
  
  func goToDismiss() {
    interactor?.dismissError()
  }
  
  func dismissError(dismissHandler: (() -> Void)?) {
    router?.dismissError(from: view, dismissHandler: dismissHandler)
  }
}
