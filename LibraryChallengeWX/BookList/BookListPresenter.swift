//
//  BookListPresenter.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 16/08/2021.
//
import Foundation

class BookListPresenter: BookListPresenterProtocol {
  // MARK: - Properties
  weak var view: BookListViewProtocol?
  var interactor: BookListInteractorProtocol?
  var router: BookListRouterProtocol?
  // MARK: - Methods
  func getBooks() {
    interactor?.getBookFromAPI()
  }
  
  func setBooks(from list: [BookViewModel]) {
    view?.loadBooks(from: list)
  }
  
  func setError(title: String?, message: String?) {
    router?.presentError(from: view, title: title, message: message)
  }
  
  func navigateToBookDetail(with book: Book) {
    router?.navigateToBookDetail(with: book, from: view)
  }
  
}
