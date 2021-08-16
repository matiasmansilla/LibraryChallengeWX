//
//  UIView+EmbeddedView.swift
//  ch15_cv_challenge
//
//  Created by Dardo Matias Mansilla on 02/04/2021.
//

import Foundation
import UIKit

extension UIView {
    
    func addEmbedded(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        self.addConstraint(self.topAnchor.constraint(equalTo: view.topAnchor))
        self.addConstraint(self.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        self.addConstraint(self.leftAnchor.constraint(equalTo: view.leftAnchor))
        self.addConstraint(self.rightAnchor.constraint(equalTo: view.rightAnchor))
    }
}
