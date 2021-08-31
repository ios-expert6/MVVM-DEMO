//
//  APICallable.swift
//  Kings Court
//
//  Created by gwl on 20/10/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
extension NetworkService {
    func login(request: LoginRequest,
               completionHandler: @escaping (_ result: Result<APIResponse<LoginResponse>, CourtError>) -> Void) {
        performRequest(endpoint: .login, method: .POST, request: request, completionHandler: completionHandler)
    }
}
