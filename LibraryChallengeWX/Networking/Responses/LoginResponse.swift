//
//  LoginResponse.swift
//  LibraryChallengeWX
//
//  Created by Dardo Matias Mansilla on 16/08/2021.
//

import Foundation

struct LoginResponse: Codable {
    var message: String?

    enum CodingKeys: String, CodingKey {
        case message
    }
}
