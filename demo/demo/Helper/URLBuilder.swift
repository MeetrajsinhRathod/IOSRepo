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
    case oneCloudLogin
    case getUpcomingMeeting(Int, Int)
}

extension HttpRequestEnum {
    
    func getBaseURL() -> String {
        switch self {
        case .oneCloudLogin, .getUpcomingMeeting:
            return "https://sandbox-api.ocmeet.us/api/v1/"
        default: return "https://reqres.in/api/"
        }
    }

    func getPath() -> String {
        switch self {
        case .getUserData: return "users"
        case .createResource: return "users"
        case .login: return "login"
        case .updatePut(let id): return "users/\(id)"
        case .updatePatch(let id): return "users/\(id)"
        case .deleteResouce(let id): return "users/\(id)"
        case .oneCloudLogin: return "auth/email-login/"
        case .getUpcomingMeeting(let page, let limit): return "meeting/schedule/upcoming_meetings/?page=\(page)&limit=\(limit)"
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
        case .updatePut: urlRequest.httpMethod = "PUT"
        case .updatePatch: urlRequest.httpMethod = "PATCH"
        case .deleteResouce: urlRequest.httpMethod = "DELETE"
        case .oneCloudLogin: urlRequest.httpMethod = "POST"
        case .getUpcomingMeeting: urlRequest.httpMethod = "GET"
        }
        return urlRequest
    }

    func setHttpBody(urlRequest: inout URLRequest, jsonData: Data?) {
        urlRequest.httpBody = jsonData
    }
}
