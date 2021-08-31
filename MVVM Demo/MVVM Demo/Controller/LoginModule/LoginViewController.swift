//
//  LoginViewController.swift
//  MLM
//
//  Created by Apple on 19/02/21.
//

import UIKit
class LoginViewController: UIViewController {
    // MARK: IBoutlet
    @IBOutlet weak var textEmailAddress: TextFieldDesingable!
    @IBOutlet weak var textPassword: TextFieldDesingable!
    @IBOutlet weak var labelRegister: UILabel!
    @IBOutlet weak var loginButton: EnableButton!
    // MARK: Declared Variable and Constant
    //var text = "Don't have an account? SIGN UP"
    lazy var viewModel: LoginViewModel = {
        let viewModel = LoginViewModel()
        return viewModel
    }()
    // MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textEmailAddress.enable = true
        textPassword.enable = true
        loginButton.enable = true
     }
    // MARK: Label Register
    /*func labelRegisterClickable() {
        labelRegister.text = text
        self.labelRegister.textColor =  UIColor.black
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "SIGN UP")
        underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold), range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range1)
        labelRegister.attributedText = underlineAttriString
        labelRegister.isUserInteractionEnabled = true
        labelRegister.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
    }
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        let termsRange = (text as NSString).range(of: "SIGN UP")
        if gesture.didTapAttributedTextInLabel(label: labelRegister, inRange: termsRange) {
        } else {
            print("Tapped none")
        }
    }*/
    func loginButtonAction() {
        viewModel.loginAPiCall(email: "Tosif@gmail.com", password: "123456")
    }
}
extension LoginViewController: LoginResultProtocol {
    func success(userDetails: LoginResponse) {
        print(userDetails.firstname ?? "")
    }
    func error(errorMessage: String, errorCode: Int) {
    }
}
