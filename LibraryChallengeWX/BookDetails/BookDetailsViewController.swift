//
//  BookDetailsViewController.swift
//  LibraryChallengeWX
//
//  Created Dardo Matias Mansilla on 17/08/2021.
//

import UIKit

class BookDetailsViewController: UIViewController, BookDetailsViewProtocol {
  // MARK: - Properties
  var presenter: BookDetailsPresenterProtocol?
  // MARK: - Initializer
  static func instantiate() -> BookDetailsViewController {
    let storyboard = UIStoryboard(name: "BookDetailsViewController", bundle: .main)
    if let viewController = storyboard.instantiateViewController(withIdentifier: "BookDetailsViewController") as? BookDetailsViewController {
      return viewController
    } else {
      return BookDetailsViewController()
    }
  }
  
    // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .cyan
    
  }
  
}
