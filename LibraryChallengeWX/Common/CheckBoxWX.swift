//
//  CheckBoxWX.swift
//  LibraryChallengeWX
//
//  Created by Dardo Matias Mansilla on 15/08/2021.
//

import UIKit

@IBDesignable
open class CheckBoxWX: UIButton {
  
  var handleAction: ( () -> Void)?
  private var isToggled: Bool = false
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    self.setTitle("", for: .normal)
    self.layer.cornerRadius = 8.0
    self.layer.borderWidth = 2.0
    self.layer.borderColor = LibraryChallengeWXConstant().lightBlueWX?.cgColor
    
    self.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
    
  }
  
  @objc private func handleTap() {
    isToggled.toggle()
    if isToggled {
      backgroundColor = LibraryChallengeWXConstant().lightBlueWX
    } else {
      backgroundColor = .clear
    }
    handleAction?()
  }
}
