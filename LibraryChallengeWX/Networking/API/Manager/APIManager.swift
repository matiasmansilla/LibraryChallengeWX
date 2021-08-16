//
//  APIManager.swift
//  TestViper
//
//  Created by Dardo Matias Mansilla on 12/08/2021.
  // MARK: - APIManager
///Here you can setup a custom Session

import Foundation
import Alamofire


class APIManager {
  
  static let networkEnviroment: NetworkEnvironment = .dev
  
  static let sessionManager: Session = {
    
    let configuration = URLSessionConfiguration.af.default
    
    configuration.timeoutIntervalForRequest = 30
    
    return Session(configuration: configuration)
  }()
  
}

// MARK: - API MANAGER EXTENSION
extension APIManager {
  
  func getRequest(type: Endpoint, parameters: Parameters?) -> DataRequest {
    return APIManager.sessionManager.request(type.url,
                                             method: type.httpMethod,
                                             parameters: parameters,
                                             encoding: type.encoding,
                                             headers: type.headers).validate()
  }
}
