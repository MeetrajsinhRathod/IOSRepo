//
//  UserProfileModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 21/06/23.
//

import Foundation

struct UserProfileResponse: Convertable {
    let status: Int
    let data: [UserProfileData]
    let message: String
}

struct UserProfileData: Convertable {
    let displayName, firstName, lastName: String
    let username, email: String
    let timeZone, domain, pk, timeFormat: String
    let avatar: String
    let isMfa, isSkipMfa: Bool
    let status, scope: String
    let lastLogin: String
    
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case firstName = "first_name"
        case lastName = "last_name"
        case username
        case email
        case pk
        case domain
        case timeZone = "time_zone"
        case timeFormat = "time_format"
        case avatar
        case status
        case scope
        case lastLogin = "last_login"
        case isMfa = "is_mfa"
        case isSkipMfa = "is_skip_mfa"
    }
}

struct StatusResponse: Convertable {
    
    let status: Int
    let data: StatusData
    let message: String
}

struct StatusData: Convertable {
    
    let status: String
    let isShowInChat: Bool = false
    let expiry: String = "2023-06-24T06:52:11.241Z"
    
    enum CodingKeys: String, CodingKey {
        case status
        case isShowInChat = "is_show_in_chat"
        case expiry
    }
}
