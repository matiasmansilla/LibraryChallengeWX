//
//  JSONDecoder.swift
//  LibraryChallengeWX
//
//  Created by Dardo Matias Mansilla on 16/08/2021.
//


import Foundation

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
