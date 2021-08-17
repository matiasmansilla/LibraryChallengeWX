//
//  BookListInteractor.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 16/08/2021.
//

import Foundation

class BookListInteractor: BookListInteractorProtocol {
  // MARK: - Properties
  weak var presenter: BookListPresenterProtocol?
  var apiDataManager: BookListAPIDataManagerProtocol?
  var bookViewModelList: [BookViewModel] = []
  var group = DispatchGroup()
  // MARK: - Methods
  func getBookFromAPI() {
    bookViewModelList = []
    apiDataManager?.getBooks(completion: { [weak self] (books, error) in
      if let books = books {
        self?.getImageFromURL(from: books)
        self?.group.notify(queue: .main) {
          self?.presenter?.setBooks(from: self?.bookViewModelList ?? [])
        }
      } else {
        self?.presenter?.setError(title: LibraryChallengeWXLocalizables().genericTitleNetworkError, message: error?.errorDescription)
      }
    })
  }
  
  private func getImageFromURL(from list: [Book]) {
    for item in list {
      group.enter()
      if let logoURL = item.image, let url = URL(string: logoURL) {
        DispatchQueue.main.async {
          if let data = try? Data(contentsOf: url) {
            self.bookViewModelList.append(BookViewModel(book: item, bookImageData: data))
            self.group.leave()
          } else {
            self.bookViewModelList.append(BookViewModel(book: item, bookImageData: nil))
            self.group.leave()
          }
        }
      } else {
        self.bookViewModelList.append(BookViewModel(book: item, bookImageData: nil))
        group.leave()
      }
    }
  }
}
