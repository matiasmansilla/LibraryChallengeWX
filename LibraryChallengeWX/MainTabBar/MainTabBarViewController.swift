//
//  MainTabBarView.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 17/08/2021.
//

import UIKit

class MainTabBarViewController: UITabBarController {
  // MARK: - Properties
  var presenter: MainTabBarPresenterProtocol?
  
    // MARK: - Constants and Localizables
  let localizables: LibraryChallengeWXLocalizables = LibraryChallengeWXLocalizables()
  
  // MARK: - Initializer
  static func instantiate() -> MainTabBarViewController {
    return MainTabBarViewController()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }
  
  func setupTabBar() {
    let libraryItem = UINavigationController(rootViewController: BookListRouter().instantiate())
    libraryItem.title = localizables.libraryTitle
    libraryItem.tabBarItem = UITabBarItem(title: localizables.libraryTitle, image: #imageLiteral(resourceName: "ic_library"), selectedImage: #imageLiteral(resourceName: "ic_library active"))
    let settingItem = UINavigationController(rootViewController: LogoutRouter().instantiate())
    settingItem.tabBarItem = UITabBarItem(title: localizables.settingsTitle, image: #imageLiteral(resourceName: "ic_settings"), selectedImage: #imageLiteral(resourceName: "ic_settings active"))
    settingItem.title = localizables.settingsTitle
    let vc2 = UIViewController()
    vc2.title = "Another"
    vc2.tabBarItem = UITabBarItem(title: "Another", image: #imageLiteral(resourceName: "ic_add new"), selectedImage: #imageLiteral(resourceName: "ic_add new active"))
    vc2.view.backgroundColor = .green
    
    viewControllers = [libraryItem, vc2, settingItem]
  }
  
}

extension MainTabBarViewController: MainTabBarViewProtocol {
  
}
