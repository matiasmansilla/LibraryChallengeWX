//
//  MainTabBarContracts.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 17/08/2021.
//

import UIKit
import Foundation
// MARK: - Presenter Protocol
protocol MainTabBarPresenterProtocol: class {
  var view: MainTabBarViewProtocol? { get set }
  var interactor: MainTabBarInteractorProtocol? { get set }
  var router: MainTabBarRouterProtocol? { get set }

}
// MARK: - View Protocol
protocol MainTabBarViewProtocol: class {
  var presenter: MainTabBarPresenterProtocol? { get set }

}
// MARK: - Interactor Protocol
protocol MainTabBarInteractorProtocol: class {
  var presenter: MainTabBarPresenterProtocol? { get set }
  var apiDataManager: MainTabBarAPIDataManagerProtocol? { get set }

}
// MARK: - Router Protocol
protocol MainTabBarRouterProtocol: class {
  func instantiate() -> MainTabBarViewController
}
// MARK: - API Data Manager Protocol
protocol MainTabBarAPIDataManagerProtocol: class {
  var network: NetworkingProtocol { get set }
}







