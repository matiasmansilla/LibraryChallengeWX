//
//  Coment.swift
//  TestViper
//
//  Created by Dardo Matias Mansilla on 14/08/2021.
//

import Foundation

struct Coment: Codable {
    var user: User?
    var id: Int?
    var content: String?

    enum CodingKeys: String, CodingKey {
        case user
        case id
        case content
    }
}
