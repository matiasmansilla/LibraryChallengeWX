//
//  Label+LocalizablesIB.swift
//  LibraryChallengeWX
//
//  Created by Dardo Matias Mansilla on 18/08/2021.
//

import UIKit

extension UILabel {
    @IBInspectable var localizableText: String? {
        get { return text }
        set(value) { text = NSLocalizedString(value!, comment: "") }
    }
}
