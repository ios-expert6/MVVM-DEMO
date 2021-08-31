//
//  LoginModel.swift
//  MVVM Demo
//
//  Created by gwl on 07/08/21.
//

import Foundation
struct LoginRequest: Codable {
    let email: String
    let password: String
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
struct LoginResponse: Decodable {
    var authorization: String?
    var userid: String?
    var firstname: String?
    var lastname: String?
    var username: String?
}
