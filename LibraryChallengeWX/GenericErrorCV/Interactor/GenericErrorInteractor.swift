//
//  GenericErrorInteractor.swift
//  GenericErrorViperSqueleton
//
//  Created by Dardo Matias Mansilla on 31/03/2021.
//

import Foundation

class GenericErrorInteractor: GenericErrorInteractorProtocol {
  // MARK: - Properties
  weak var presenter: GenericErrorPresenterProtocol?
  var titleError: String?
  var messageError: String?
  var dismissHandler: (() -> Void)?
  // MARK: - Initializer
  init(titleError: String?, messageError: String?, dismissHandler: (() -> Void)?) {
    self.titleError = titleError
    self.messageError = messageError
    self.dismissHandler = dismissHandler
  }
  // MARK: - Methods
  func getErrorData() {
    guard let titleError = titleError, let messageError = messageError else { return }
    presenter?.setErrorData(with: titleError, message: messageError)
  }
  
  func dismissError() {
    presenter?.dismissError(dismissHandler: dismissHandler)
  }
}
