//
//  GenericErrorViewController.swift
//  GenericErrorViperSqueleton
//
//  Created by Dardo Matias Mansilla on 31/03/2021.
//

import UIKit

class GenericErrorViewController: UIViewController {
  // MARK: - Outlets
  @IBOutlet weak var tappableView: UIView?
  @IBOutlet weak var titleErrorLabel: UILabel?
  @IBOutlet weak var errorMessageLabel: UILabel?
  // MARK: - Properties
  var presenter: GenericErrorPresenterProtocol?
  // MARK: - Initializer
  static func instantiate() -> GenericErrorViewController {
    let storyboard = UIStoryboard(name: "GenericErrorViewController", bundle: .main)
    if let viewController = storyboard.instantiateViewController(withIdentifier: "GenericErrorViewController") as? GenericErrorViewController {
      viewController.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
      viewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
      return viewController
    } else {
      return GenericErrorViewController()
    }
  }
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTappableView()
    presenter?.getErrorData()
  }
  // MARK: - Private Methods
  func setupTappableView() {
    let tapView = UITapGestureRecognizer(target: self, action: #selector(self.onTappableAreaTapped))
    tappableView?.addGestureRecognizer(tapView)
  }
  
  @objc private func onTappableAreaTapped() {
    presenter?.goToDismiss()
  }
  // MARK: - Private Action Button Methods
  @IBAction func okButtonTapped(_ sender: Any) {
    presenter?.goToDismiss()
  }
}
// MARK: - Extension GenericErrorViewProtocol
extension GenericErrorViewController: GenericErrorViewProtocol {
  func loadErrorData(with title: String, message: String) {
    DispatchQueue.main.async {
      self.titleErrorLabel?.text = title
      self.errorMessageLabel?.text = message
    }
  }
}
