//
//  LogoutViewController.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 17/08/2021.
//

import UIKit

class LogoutViewController: UIViewController, LogoutViewProtocol {
  // MARK: - Properties
  var presenter: LogoutPresenterProtocol?
  // MARK: - Initializer
  static func instantiate() -> LogoutViewController {
    let storyboard = UIStoryboard(name: "LogoutViewController", bundle: .main)
    if let viewController = storyboard.instantiateViewController(withIdentifier: "LogoutViewController") as? LogoutViewController {
      return viewController
    } else {
      return LogoutViewController()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    setupNavBar()
  }
  
  private func setupNavBar() {
    let image = UIImage(named: "bc_nav bar")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
    self.navigationController?.navigationBar.barStyle = .black
    self.navigationController?.navigationBar.tintColor = .white
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }
  
  @IBAction func logoutButtonAction(_ sender: Any) {
    presenter?.logout()
  }
  
  
}
