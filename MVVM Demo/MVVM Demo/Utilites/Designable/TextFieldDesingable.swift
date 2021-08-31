//
//  TextFieldDesingable.swift
//  MLM
//
//  Created by Apple on 19/02/21.
//

import Foundation
import UIKit
class TextFieldDesingable: UITextField {
     var enable: Bool = true {
        didSet {
                borderStyle = .none
                backgroundColor = UIColor.white // Use anycolor that give you a 2d look.
                //To apply corner radius
                layer.cornerRadius = frame.size.height / 2
                //To apply border
                layer.borderWidth = 0.25
                layer.borderColor = UIColor.white.cgColor
                //To apply Shadow
                layer.shadowOpacity = 0.4
                layer.shadowRadius = 3.0
                layer.shadowOffset =  CGSize(width: 0, height: 0)
                layer.shadowColor = UIColor.shadowColor.cgColor
                //To apply padding
                let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.frame.size.height))
                leftView = paddingView
                leftViewMode = UITextField.ViewMode.always//UITextFieldViewMode.always
        }
    }
    
    var addenable: Bool = true {
       didSet {
               borderStyle = .none
               backgroundColor = UIColor.white // Use anycolor that give you a 2d look.
               //To apply corner radius
               layer.cornerRadius = frame.size.height / 2
               //To apply border
               layer.borderWidth = 0.25
               layer.borderColor = UIColor.white.cgColor
               //To apply Shadow
               layer.shadowOpacity = 0.4
               layer.shadowRadius = 3.0
               layer.shadowOffset =  CGSize(width: 0, height: 0)
               layer.shadowColor = UIColor.shadowColor.cgColor
               //To apply padding
               let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.size.height))
               leftView = paddingView
               leftViewMode = UITextField.ViewMode.always//UITextFieldViewMode.always
       }
   }
}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
