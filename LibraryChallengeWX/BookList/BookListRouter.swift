//
//  BookListRouter.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 16/08/2021.
//
import UIKit

class BookListRouter: BookListRouterProtocol {
  func goToBookList(from context: AnyObject?) {
    guard let context = context as? UIViewController else { return }
    let view = BookListViewController.instantiate()
    let presenter: BookListPresenterProtocol = BookListPresenter()
    let interactor: BookListInteractorProtocol = BookListInteractor()
    let router: BookListRouterProtocol = BookListRouter()
    let apiDataManager: BookListAPIDataManagerProtocol = BookListAPIDataManager()
    ///Connections
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.apiDataManager = apiDataManager
    ///Navigation
    context.navigationController?.setViewControllers([view], animated: true)
  }
  
  func navigateToBookDetail(with book: Book, from context: AnyObject?) {
    //
  }
  
  func presentError(from context: AnyObject?, title: String?, message: String?) {
    guard let context = context as? UIViewController else { return }
    GenericErrorRouter().showGenericError(from: context, title: title, message: message) {
      context.hideLoadingOverlay()
    }
  }
}
