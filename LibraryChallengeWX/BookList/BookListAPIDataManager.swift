//
//  BookListAPIDataManager.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//

import Alamofire

class BookListAPIDataManager: BookListAPIDataManagerProtocol {
  // MARK: - Properties
  var network: NetworkingProtocol = Networking(apiManager: APIManager())
  // MARK: - Methods
  func getBooks(completion: @escaping ([Book]?, AFError?) -> Void) {
    network.execute(Endpoint.books, parameters: nil, completion: completion)
  }
}
