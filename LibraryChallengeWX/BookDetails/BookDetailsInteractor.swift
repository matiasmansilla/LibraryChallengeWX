//
//  BookDetailsInteractor.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 17/08/2021.
//

import Foundation

class BookDetailsInteractor: BookDetailsInteractorProtocol {
  
  // MARK: - Properties
  weak var presenter: BookDetailsPresenterProtocol?
  var apiDataManager: BookDetailsAPIDataManagerProtocol?
  // MARK: - Methods
}