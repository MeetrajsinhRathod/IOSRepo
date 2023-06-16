//
//  UrlBuilder.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 05/06/23.
//

import UIKit

protocol Convertable: Codable { }

extension Convertable {
    func convertToData() -> Data? {
        guard let jsonData = try? JSONEncoder().encode(self)
            else {
            print("Error: Trying to convert model to JSON data")
            return nil
        }
        return jsonData
    }
}

enum WebSerciveType {
    case urlSession
    case alamofire
}

enum HttpRequestEnum {
    case getUserData
    case createResource
    case login
    case updatePut(Int)
    case updatePatch(Int)
    case deleteResouce(Int)
}

extension HttpRequestEnum {
    
    func getBaseURL() -> String {
        "https://reqres.in/api/"
    }

    func getPath() -> String {
        switch self {
        case .getUserData: return "users"
        case .createResource: return "users"
        case .login: return "login"
        case .updatePut(let id): return "users/\(id)"
        case .updatePatch(let id): return "users/\(id)"
        case .deleteResouce(let id): return "users/\(id)"
        }
    }
    
    func getTargetURL() -> String {
        getBaseURL()+getPath()
    }

    func setUrlRequest(url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        switch self {
        case .getUserData: urlRequest.httpMethod = "GET"
        case .createResource, .login : urlRequest.httpMethod = "POST"
        case .updatePut(_): urlRequest.httpMethod = "PUT"
        case .updatePatch(_): urlRequest.httpMethod = "PATCH"
        case .deleteResouce(_): urlRequest.httpMethod = "DELETE"
        }
        return urlRequest
    }

    func setHttpBody(urlRequest: inout URLRequest, jsonData: Data?) {
        urlRequest.httpBody = jsonData
    }
}
