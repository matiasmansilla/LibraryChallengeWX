//
//  Book.swift
//  TestViper
//
//  Created by Dardo Matias Mansilla on 12/08/2021.
//

import Foundation

struct Book: Codable {
    var image: String?
    var title: String?
    var id: Int?
    var author: String?
    var year: String?
    var status: String?
    var genre: String?

    enum CodingKeys: String, CodingKey {
        case image
        case title
        case id
        case author
        case year
        case status
        case genre
    }
}
