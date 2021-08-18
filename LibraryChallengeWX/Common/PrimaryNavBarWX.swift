//
//  PrimaryNavBarWX.swift
//  LibraryChallengeWX
//
//  Created by Dardo Matias Mansilla on 18/08/2021.
//

import UIKit

class PrimaryNavBarWX: UINavigationBar {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
//  override func draw(_ rect: CGRect) {
//    commonInit()
//  }
  
  private func commonInit() {
    
    let image = UIImage(named: "bc_nav bar")?.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), resizingMode: .stretch)
    self.shadowImage = UIImage()
    self.setBackgroundImage(image, for: .default)
    self.barStyle = .black
    self.tintColor = .white
    self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }
  }
  
  
  
