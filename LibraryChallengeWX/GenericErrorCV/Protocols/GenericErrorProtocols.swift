//
//  ViperExampleProtocols.swift
//  GenericErrorViperSqueleton
//
//  Created by Dardo Matias Mansilla on 31/03/2021.
//

import Foundation
// MARK: - Presenter Protocol
protocol GenericErrorPresenterProtocol: class {
  var view: GenericErrorViewProtocol? { get set }
  var interactor: GenericErrorInteractorProtocol? { get set }
  var router: GenericErrorRouterProtocol? { get set }
  func getErrorData()
  func setErrorData(with title: String, message: String)
  func goToDismiss()
  func dismissError(dismissHandler: (() -> Void)?)
}
// MARK: - View Protocol
protocol GenericErrorViewProtocol: class {
  var presenter: GenericErrorPresenterProtocol? { get set }
  func loadErrorData(with title: String, message: String)
}
// MARK: - Interactor Protocol
protocol GenericErrorInteractorProtocol: class {
  var presenter: GenericErrorPresenterProtocol? { get set }
  func getErrorData()
  func dismissError()
}
// MARK: - Router Protocol
protocol GenericErrorRouterProtocol: class {
  func showGenericError(from context: AnyObject?, title: String?, message: String?, dismissHandler: (() -> Void)?)
  func dismissError(from context: AnyObject?, dismissHandler: (() -> Void)?)
}
