//
//  Networking.swift
//  TestViper
//
//  Created by Dardo Matias Mansilla on 14/08/2021.
//

import Foundation
import Alamofire

protocol NetworkingProtocol {
  func execute<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (_ data: T?, _ error: AFError?) -> Void)
}

class Networking {
  
  let apiManager: APIManager
  
  init(apiManager: APIManager) {
    self.apiManager = apiManager
  }
}

extension Networking: NetworkingProtocol {
  func execute<T>(_ endpoint: Endpoint, completion: @escaping (T?, AFError?) -> Void) where T : Decodable {
    apiManager.getRequest(type: endpoint).validate().responseDecodable(of: T.self) { (dataResponse: AFDataResponse<T>) in
      switch dataResponse.result {
      case .success:
        completion(dataResponse.value, nil)
      case .failure(let error):
        completion(nil, error)
      }
    }
  }
}
