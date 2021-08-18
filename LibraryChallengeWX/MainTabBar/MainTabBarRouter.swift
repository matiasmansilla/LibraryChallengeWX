//
//  MainTabBarRouter.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 17/08/2021.
//
import UIKit

class MainTabBarRouter: MainTabBarRouterProtocol {
  private var navigationController: UINavigationController?
  // MARK: - Methods
  func instantiate() -> MainTabBarViewController {
    let view = MainTabBarViewController.instantiate()
    let presenter: MainTabBarPresenterProtocol = MainTabBarPresenter()
    let interactor: MainTabBarInteractorProtocol = MainTabBarInteractor()
    let router: MainTabBarRouterProtocol = MainTabBarRouter()
    let apiDataManager: MainTabBarAPIDataManagerProtocol = MainTabBarAPIDataManager()
    ///Connections
    view.presenter = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.apiDataManager = apiDataManager
    //TabBarController Setup
//    let libraryItem = UINavigationController(rootViewController: BookListRouter().instantiate())
//    let settingItem = UINavigationController(rootViewController: LogoutRouter().instantiate())
//    
//    let vc2 = UIViewController()
//    vc2.title = "Another"
//    vc2.view.backgroundColor = .green
//    
//    view.viewControllers = [libraryItem, vc2, settingItem]
    
    return view
  }
  
}
