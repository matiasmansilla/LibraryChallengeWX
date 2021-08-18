//
//  SecondaryButtonWX.swift
//  LibraryChallengeWX
//
//  Created by Dardo Matias Mansilla on 17/08/2021.
//

import UIKit

@IBDesignable
open class SecondaryButtonWX: UIButton {
    // MARK: - Constants
  let constants = LibraryChallengeWXConstant()
  public override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required public init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    
    self.layer.borderWidth = constants.borderSecondaryButton
    self.layer.borderColor = constants.lightBlueWX?.cgColor
    self.layer.masksToBounds = true
  }
  
  open override func draw(_ rect: CGRect) {
    print(frame.height)
    self.layer.cornerRadius = frame.height/2
    self.layer.masksToBounds = true
  }
  
}
