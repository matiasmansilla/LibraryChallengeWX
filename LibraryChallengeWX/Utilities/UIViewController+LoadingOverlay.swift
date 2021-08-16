//
//  UIViewController+LoadinfOverlay.swift
//  ch15_cv_challenge
//
//  Created by Dardo Matias Mansilla on 02/04/2021.
//

import UIKit
extension UIViewController {

  func showLoadingOverlay() {
    LoadingOverlay.shared.show(over: self.view)
  }
  
  func hideLoadingOverlay(){
      LoadingOverlay.shared.hide()
  }
}
