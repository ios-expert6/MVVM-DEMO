//
//  SignUpViewController.swift
//  MLM
//
//  Created by Apple on 19/02/21.
//

import UIKit

class SignUpViewController: UIViewController {
    // MARK: IBoutlet
    @IBOutlet weak var textFirstName: TextFieldDesingable!
    @IBOutlet weak var textSurname: TextFieldDesingable!
    @IBOutlet weak var textEmailAddress: TextFieldDesingable!
    @IBOutlet weak var textPhoneNo: TextFieldDesingable!
    @IBOutlet weak var textCountry: TextFieldDesingable!
    @IBOutlet weak var textState: TextFieldDesingable!
    @IBOutlet weak var textCity: TextFieldDesingable!
    @IBOutlet weak var textHouseNO: TextFieldDesingable!
    @IBOutlet weak var textViewAddress: UITextView!
    @IBOutlet weak var textZipCode: TextFieldDesingable!
    @IBOutlet weak var textPassword: TextFieldDesingable!
    @IBOutlet weak var textConfirmPassword: TextFieldDesingable!
    @IBOutlet weak var textReferralCode: TextFieldDesingable!
    @IBOutlet weak var textNameofReferral: TextFieldDesingable!
    @IBOutlet weak var houseStreetAddressView: UIView!
    @IBOutlet weak var labelLogin: UILabel!
    @IBOutlet weak var labelPrivacy: UILabel!
    @IBOutlet weak var signUpButton: EnableButton!
    // MARK: Declared Variable and Constant
    //var text = "Already Have An Account? LOGIN"
    //ar privacy = "By signing up on our platform, you agree you have read and agree to our Terms and Conditions."

    // MARK: View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textFirstName.enable = true
        textSurname.enable = true
        textEmailAddress.enable = true
        textPhoneNo.enable = true
        textCountry.enable = true
        textState.enable = true
        textCity.enable = true
        textHouseNO.enable = true
        textZipCode.enable = true
        textPassword.enable = true
        textConfirmPassword.enable = true
        textReferralCode.enable = true
        textNameofReferral.enable = true
        houseStreetAddressView.layer.cornerRadius = 10
        houseStreetAddressView.layer.borderColor = UIColor.disableColor.cgColor
        houseStreetAddressView.backgroundColor = .white
        houseStreetAddressView.layer.masksToBounds = false
        houseStreetAddressView.layer.cornerRadius = 10.0
        houseStreetAddressView.layer.shadowColor = UIColor.shadowColor.cgColor
        houseStreetAddressView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        houseStreetAddressView.layer.shadowRadius = 6.0
        houseStreetAddressView.layer.shadowOpacity = 0.7
        signUpButton.enable = true
      }
    // MARK: Label Register
   /* func labelRegisterClickable() {
        labelLogin.text = text
        self.labelLogin.textColor =  UIColor.black
        let underlineAttriString = NSMutableAttributedString(string: text)
        let range1 = (text as NSString).range(of: "LOGIN")
        underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold), range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: range1)
        labelLogin.attributedText = underlineAttriString
        labelLogin.isUserInteractionEnabled = true
        labelLogin.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
    }
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        let termsRange = (text as NSString).range(of: "LOGIN")
        if gesture.didTapAttributedTextInLabel(label: labelLogin, inRange: termsRange) {

        } else {
            print("Tapped none")
        }
    }
    func labelPrivacyClickable() {
        labelPrivacy.text = privacy
        self.labelPrivacy.textColor =  UIColor.black
        let underlineAttriString = NSMutableAttributedString(string: privacy)
        let range1 = (privacy as NSString).range(of: "Terms and Conditions.")
        underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.bold), range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.loginColor, range: range1)
        labelPrivacy.attributedText = underlineAttriString
        labelPrivacy.isUserInteractionEnabled = true
        labelPrivacy.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabelPrivacy(gesture:))))
    }
    @IBAction func tapLabelPrivacy(gesture: UITapGestureRecognizer) {
        let termsRange = (privacy
                            as NSString).range(of: "Terms and Conditions.")
        if gesture.didTapAttributedTextInLabel(label: labelPrivacy, inRange: termsRange) {

        } else {
            print("Tapped none")
        }
    }*/

}
