//
//  BookDetailsContracts.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 17/08/2021.
//

import UIKit
import Foundation
// MARK: - Presenter Protocol
protocol BookDetailsPresenterProtocol: class {
  var view: BookDetailsViewProtocol? { get set }
  var interactor: BookDetailsInteractorProtocol? { get set }
  var router: BookDetailsRouterProtocol? { get set }

}
// MARK: - View Protocol
protocol BookDetailsViewProtocol: class {
  var presenter: BookDetailsPresenterProtocol? { get set }

}
// MARK: - Interactor Protocol
protocol BookDetailsInteractorProtocol: class {
  var presenter: BookDetailsPresenterProtocol? { get set }
  var apiDataManager: BookDetailsAPIDataManagerProtocol? { get set }

}
// MARK: - Router Protocol
protocol BookDetailsRouterProtocol: class {
  func navigateToBookDetails(from context: AnyObject?)

}
// MARK: - API Data Manager Protocol
protocol BookDetailsAPIDataManagerProtocol: class {
  var network: NetworkingProtocol { get set }
}







