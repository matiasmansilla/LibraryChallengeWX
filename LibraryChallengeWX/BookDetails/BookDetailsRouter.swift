//
//  BookDetailsRouter.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 17/08/2021.
//
import UIKit

class BookDetailsRouter: BookDetailsRouterProtocol {
  func navigateToBookDetails(from context: AnyObject?) {
    guard let context = context as? UIViewController else { return }
    let view = BookDetailsViewController.instantiate()
    let presenter: BookDetailsPresenterProtocol = BookDetailsPresenter()
    let interactor: BookDetailsInteractorProtocol = BookDetailsInteractor()
    let router: BookDetailsRouterProtocol = BookDetailsRouter()
    let apiDataManager: BookDetailsAPIDataManagerProtocol = BookDetailsAPIDataManager()
    ///Connections
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.apiDataManager = apiDataManager
    ///Navigation
    context.navigationController?.pushViewController(view, animated: true)
  }
  
  // MARK: - Methods
}
