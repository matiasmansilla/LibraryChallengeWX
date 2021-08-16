//
//  Endpoint.swift
//  TestViper
//
//  Created by Dardo Matias Mansilla on 14/08/2021.
//
// MARK: - Endpoint
///Here you setup all your Endpoints

import Alamofire
import Foundation

// MARK: - Endpoint Network Protocol
protocol EndPointType {
  var baseURL: String { get }
  var path: String { get }
  var httpMethod: HTTPMethod { get }
  var headers: HTTPHeaders? { get }
  var url: URL { get }
  var encoding: ParameterEncoding { get }
}

// MARK: - Endpoints

enum Endpoint {
  case signin
  case books
  case comments(_: String)
  case suggestions
}

// MARK: - EndPointType Extension
extension Endpoint: EndPointType {
  
  var baseURL: String {
    switch APIManager.networkEnviroment {
    case .dev: return "https://private-59a7d9-iostrainingapi.apiary-mock.com/"
    case .stage: return "https://private-anon-7c80e91b0c-iostrainingapi.apiary-proxy.com/"
    case .production: return "https://polls.apiblueprint.org/"
    }
  }
  
  var path: String {
    switch self {
    case .signin:
      return "signin"
    case .books:
      return "books"
    case .comments(let bookId):
      return "books/\(bookId)/comments"
    case .suggestions:
      return "books/%@/suggestions"
    }
  }
  
  var httpMethod: HTTPMethod {
    switch self {
    case .signin:
      return .post
    default :
      return .get
    }
  }
  
  var headers: HTTPHeaders? {
    switch self {
    case .signin:
      return ["Content-Type": "application/json",
              "Accept": "application/json"]
    default:
      return ["Content-Type": "application/json"]
    }
  }
  
  var url: URL {
    guard let url = URL(string: baseURL + path) else { preconditionFailure("Invalid URL") }
    return url
  }
  
  var encoding: ParameterEncoding {
    switch self {
    case .signin:
      return JSONEncoding.default
    default:
//      return JSONEncoding.default
      return URLEncoding.queryString
    }
  }
  
}
