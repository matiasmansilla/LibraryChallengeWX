//
//  PrimaryButtonWX.swift
//  LibraryChallengeWX
//
//  Created by Dardo Matias Mansilla on 15/08/2021.
//

import UIKit

@IBDesignable
open class PrimaryButtonWX: UIButton {
  
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
    let image = UIImage(named: "img_main button")
    
    self.setBackgroundImage(image, for: .normal)
    self.layer.cornerRadius = 22
    self.layer.masksToBounds = true
    let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                           NSAttributedString.Key.font: UIFont(name:"Montserrat-Bold" , size: 18) ?? UIFont()]
    let attributtedtitle = NSAttributedString(string: "Continuar", attributes: attributes)
    setAttributedTitle(attributtedtitle, for: .normal)
  }
  
}
