//
//  BaseErrorResponse.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 23/06/23.
//

import Foundation

struct BaseErrorResponse: Codable {
    let status: Int
    let data: BaseError
    let message: String
}

struct BaseError: Codable {
    let error: String?
}
