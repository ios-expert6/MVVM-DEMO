//
//  validations.swift
//  ProjectSetup
//
//  Created by shrikant upadhyay on 07/08/21.
//

import Foundation
import UIKit

struct LocalValidationResult {
    let success:Bool
    let title:String?
    let error:String?
}

struct LocalValidation {
    
//    LogIn
    func LocalValidationLogIn(email:String,password:String) -> LocalValidationResult {
        let logInEmail:String? = email
        let logInPassword:String? = password
        
        guard let emailID = logInEmail, emailID != "" else {
            return LocalValidationResult(success: false, title: "Email ID", error: Constants.emptyEmail)
        }
        
        if !((logInEmail?.isValidEmail())!) {
            return LocalValidationResult(success: false, title: "Email ID", error: Constants.invalidEmail)
        }
        
        guard let passwordStr = logInPassword, passwordStr != "" else {
            return LocalValidationResult(success: false, title: "Email ID", error: Constants.invalidPassword)
        }
        
        return LocalValidationResult(success: true, title: "", error: nil)
    }
    
//    FogotPassword
    func ValidateForgotPassword(email: String) -> LocalValidationResult{
        
        let forgotPasswordEmail:String? = email
        
              guard let emaildId = forgotPasswordEmail,emaildId != "" else {
                return LocalValidationResult(success: false, title: "Email ID", error: Constants.emptyEmail)
                     }
        
        if !((forgotPasswordEmail?.isValidEmail())!) {
            return LocalValidationResult(success: false, title: "Email ID", error: Constants.invalidEmail)
        }
        
        return LocalValidationResult(success: true, title: "", error: nil)
    }
}



















////  error message
//struct ValidationError: Error {
//    var message: String
//
//    init(_ message: String) {
//        self.message = message
//    }
//}
//
//protocol ValidatorConvertible {
//    func validated(_ value: String?) throws -> String
//}
//
//// type of validation
//enum ValidatorType {
//    case email
//    case password
//}
//
//enum VaildatorFactory {
//    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
//        switch type {
//        case .email: return EmailValidator()
//        case .password: return PasswordValidator()
//
//        }
//    }
//}
//
//extension UITextField {
//    func validatedText(validationType: ValidatorType) throws -> String {
//        let validator = VaildatorFactory.validatorFor(type: validationType)
//        return try validator.validated(self.text!)
//    }
//}
//
//// validation function
//struct EmailValidator:ValidatorConvertible {
//    func validated(_ value: String?) throws -> String {
//        if value!.isEmpty {
//            throw ValidationError(Constants.emptyEmail)
//        } else {
//            do {
//                if try value?.isValidEmail() == false {
//                    throw ValidationError(Constants.invalidEmail)
//                }
//            } catch {
//                throw ValidationError(Constants.invalidEmail)
//            }
//        }
//        return value!
//    }
//}
//
//struct PasswordValidator:ValidatorConvertible {
//    func validated(_ value: String?) throws -> String {
//        if value!.isEmpty {
//            throw ValidationError(Constants.emptyPassword)
//        }
//        do {
//            if try value?.isValidPassword() == false {
//                throw ValidationError(Constants.invalidPassword)
//            }
//        } catch {
//            throw ValidationError(Constants.invalidPassword)
//        }
//        return value!
//    }
//}
