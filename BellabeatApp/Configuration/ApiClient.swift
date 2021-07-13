//
//  ApiClient.swift
//  BellabeatApp
//
//  Created by Elvis on 7/13/21.
//

import Foundation
import Alamofire

protocol ApiClientProtocol: NSObject {
    // get array of values
    func get<T: Decodable>(path: String, parameters: [String: Any], success: @escaping ([T]) -> (), failure: @escaping (Error) -> ())
    // get object
    func get<T: Decodable>(path: String, parameters: [String: Any], success: @escaping (T) -> (), failure: @escaping (Error) -> ())
    
    func post() // TODO
    func put() // TODO
    func delete() // TODO
}

class ApiClient: NSObject, ApiClientProtocol {
    
    var baseURL: URL {
        return URL(string: Constants.baseUrl)!
    }
    
    var baseHeaders: HTTPHeaders = [
        "Accept": "application/json"
    ]
    
    private enum Constants {
        static let baseUrl: String = "https://d2t41j3b4bctaz.cloudfront.net/"
    }

    func get<T>(path: String, parameters: [String: Any], success: @escaping ([T]) -> (), failure: @escaping (Error) -> ()) where T : Decodable {
        let url = baseURL.appendingPathComponent(path)

        AF.request(url, parameters: parameters, headers: baseHeaders).responseDecodable(of: [T].self) { response in
            if let responseValue = response.value {
                success(responseValue)
            } else {
                failure(response.error ?? NSError(domain: "Data source", code: 0, userInfo: nil))
            }
        }
    }
    
    func get<T>(path: String, parameters: [String: Any], success: @escaping (T) -> (), failure: @escaping (Error) -> ()) where T : Decodable {
        let url = baseURL.appendingPathComponent(path)
        
        AF.request(url, parameters: parameters, headers: baseHeaders).responseDecodable(of: T.self) { response in
            if let responseValue = response.value {
                success(responseValue)
            } else {
                failure(response.error ?? NSError(domain: "Data source", code: 0, userInfo: nil))
            }
        }
    }
    
    func post() {
        // TODO
    }
    
    func put() {
        // TODO
    }
    
    func delete() {
        // TODO
    }
    
}
