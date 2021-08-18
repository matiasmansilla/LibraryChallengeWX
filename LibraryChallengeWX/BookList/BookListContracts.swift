//
//  BookListContracts.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 16/08/2021.
//

import Alamofire

// MARK: - Presenter Protocol
protocol BookListPresenterProtocol: class {
  var view: BookListViewProtocol? { get set }
  var interactor: BookListInteractorProtocol? { get set }
  var router: BookListRouterProtocol? { get set }
  func getBooks()
  func setBooks(from list: [BookViewModel])
  func setError(title: String?, message: String?)
  func navigateToBookDetail(with book: Book)
}
// MARK: - View Protocol
protocol BookListViewProtocol: class {
  var presenter: BookListPresenterProtocol? { get set }
  func loadBooks(from list: [BookViewModel])
}
// MARK: - Interactor Protocol
protocol BookListInteractorProtocol: class {
  var presenter: BookListPresenterProtocol? { get set }
  var apiDataManager: BookListAPIDataManagerProtocol? { get set }
  func getBookFromAPI()
}
// MARK: - Router Protocol
protocol BookListRouterProtocol: class {
  func instantiate() -> BookListViewController
  func goToBookList(from context: AnyObject?)
  func navigateToBookDetail(with book: Book, from context: AnyObject?)
  func presentError(from context: AnyObject?, title: String?, message: String?)
}
// MARK: - API Data Manager Protocol
protocol BookListAPIDataManagerProtocol: class {
  var network: NetworkingProtocol { get set }
  func getBooks(completion: @escaping (_ response: [Book]?, _ error: AFError?) -> Void)
}







