//
//  User.swift
//  TestViper
//
//  Created by Dardo Matias Mansilla on 14/08/2021.
//

import Foundation

struct User: Codable {
  var name: String?
  var lastname: String?
  var email: String?
  var age: Int?
  var username: String?
  var id: Int?
  var image: String?
  
  enum CodingKeys: String, CodingKey {
    case name
    case lastname
    case email
    case age
    case username
    case id
    case image
  }
}
