//
//  Response.swift
//  Kings Court
//
//  Created by gwl on 20/10/20.
//  Copyright © 2020 gwl. All rights reserved.
//
// swiftlint:disable all
import Foundation
import UIKit
enum Response {
    // MARK: Login Response
    struct LoginResponse: Decodable {
        var Authorization: String?
        var id: String?
        var first_name: String?
        var last_name: String?
        var username: String?
        var email: String?
        var password: String?
        var phone: String?
        var image: String?
        var status: String?
        var role_id: String?
    }
}
