//
//  LoginModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 12/06/23.
//

import Foundation

struct OneCloudUserLogin: Codable {
    var email: String
    var password: String
}

struct OneCloudLoginResponse: Codable {
    let status: Int
    let data: [OneCloudUser]
    let message: String
}

struct OneCloudUser: Codable {
    let token: String
    let isMfa: Bool
    let aud: String
    let exp, iat: Int
    let iss, sub: String
    let timeOut: Int
    let domain, territory, user, userEmail: String
    let userScope, displayName, department, login: String
    let isSkipMfa: Bool
    let refreshToken, firstName, lastName, email: String
    let username: String

    enum CodingKeys: String, CodingKey {
        case token
        case isMfa = "is_mfa"
        case aud, exp, iat, iss, sub
        case timeOut = "time_out"
        case domain, territory, user
        case userEmail = "user_email"
        case userScope = "user_scope"
        case displayName, department, login
        case isSkipMfa = "is_skip_mfa"
        case refreshToken = "refresh_token"
        case firstName = "first_name"
        case lastName = "last_name"
        case email, username
    }
}

struct ErrorResponse: Convertable {
    let status: Int
    let data: ErrorMessage
    let message: String
    
    struct ErrorMessage: Convertable {
        let message: String
    }
}
