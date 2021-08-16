//
//  GenericErrorRouter.swift
//  GenericErrorViperSqueleton
//
//  Created by Dardo Matias Mansilla on 31/03/2021.
//

import UIKit

class GenericErrorRouter: GenericErrorRouterProtocol {
  // MARK: - Private Methods
  private func createGenericErrorViewController() -> GenericErrorViewController {
    return GenericErrorViewController.instantiate()
  }
  // MARK: - Methods
  func showGenericError(from context: AnyObject?, title: String?, message: String?, dismissHandler: (() -> Void)?) {
    guard let context = context as? UIViewController else { return }
    let viewController = createGenericErrorViewController()
    let presenter: GenericErrorPresenterProtocol = GenericErrorPresenter()
    let interactor: GenericErrorInteractorProtocol = GenericErrorInteractor(titleError: title, messageError: message, dismissHandler: dismissHandler)
    let router: GenericErrorRouterProtocol = GenericErrorRouter()
    ///Connections
    viewController.presenter = presenter
    presenter.view = viewController
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    ///Presentation
    context.present(viewController, animated: true, completion: nil)
  }
  
  func dismissError(from context: AnyObject?, dismissHandler: (() -> Void)?) {
    guard let context = context as? UIViewController else { return }
    context.dismiss(animated: true, completion: dismissHandler)
  }
}
