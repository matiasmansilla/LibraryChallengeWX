//
//  String+Localized.swift
//  LibraryChallengeWX
//
//  Created by Dardo Matias Mansilla on 15/08/2021.
//

import Foundation
extension String {

  var localizedString: String {
    NSLocalizedString(self, bundle: .main, value: "", comment: self)
  }
}
