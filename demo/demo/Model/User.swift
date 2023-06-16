//
//  User.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 05/06/23.
//

import Foundation

struct UserList: Convertable {
    var data = [User]()
}

struct User: Convertable {
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: URL
}

struct Employee: Convertable {
    var name: String
    var job: String
}

struct UserRegister: Convertable {
    var email: String?
    var password: String?
    var token: String?
}

struct DeleteStatus: Convertable {
    var status: String
}
