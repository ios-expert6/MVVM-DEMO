//
//  LoginViewModel.swift
//  MVVM Demo
//
//  Created by gwl on 07/08/21.
//

import Foundation
// All buisness logic write here
protocol LoginResultProtocol: class {
    func success(userDetails: LoginResponse)
    func error(errorMessage: String, errorCode: Int)
}
class LoginViewModel {
    weak var delegate: LoginResultProtocol?
    func loginAPiCall(email: String, password: String) {
        let loginParameter = LoginRequest(email: email, password: password)
        NetworkService.shared.login(request: loginParameter) { result in
            switch result {
            case .success(let response):
                self.delegate?.success(userDetails: response.data)
                UserDefaults.standard.setValue(response.data.authorization,
                                               forKey: UserDefaultKey.authorization.rawValue)
            case .failure(let error): debugPrint(error.error.errorMessage)
                self.delegate?.error(errorMessage: error.error.errorMessage, errorCode: error.error.errorCode ?? 0)
            }
        }
    }
}
