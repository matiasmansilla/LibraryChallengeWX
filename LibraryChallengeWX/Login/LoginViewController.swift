//
//  LoginView.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 15/08/2021.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
  // MARK: - Properties
  var presenter: LoginPresenterProtocol?
  
    // MARK: - Constants and Localizables
  let constant: LibraryChallengeWXConstant = LibraryChallengeWXConstant()
  let localizables: LibraryChallengeWXLocalizables = LibraryChallengeWXLocalizables()
  // MARK: - Initializer
  static func instantiate() -> LoginViewController {
    let storyboard = UIStoryboard(name: "LoginViewController", bundle: .main)
    if let viewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
      return viewController
    } else {
      return LoginViewController()
    }
  }
    // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  
  private func setupUI() {
    
    self.title = localizables.loginTitle
    
    view.backgroundColor = constant.bgMainScreenColor
  }
}
