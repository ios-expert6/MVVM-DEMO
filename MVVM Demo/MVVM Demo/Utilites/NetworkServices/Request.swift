//
//  Request.swift
//  Kings Court
//
//  Created by gwl on 20/10/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation

enum Request {
    //MARK: Login Request
    struct Login: Codable {
        let email: String
        let password: String
    }
}
