//
//  UITextFieldExtension.swift
//  Kings Court
//
//  Created by gwl on 04/12/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
extension UITextField {
    func setMaximumTextFieldLength(range: NSRange, string: String, maxLength: Int) -> Bool {
        let currentString: NSString = (self.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    func textFieldNotAcceptWhiteSpace(range: NSRange, string: String) -> Bool {
        let newString = (self.text! as NSString).replacingCharacters(in: range,
                                                                     with: string) as NSString
        return newString.rangeOfCharacter(from: CharacterSet.whitespacesAndNewlines).location != 0
    }
    func textFieldAcceptOnlyDigits(range: NSRange, string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    func textFieldAcceptCardNumber(range: NSRange, string: String) -> (String, Bool) {
        let replacementStringIsLegal = string.rangeOfCharacter(from: CharacterSet(charactersIn: "0123456789").inverted) == nil
        if !replacementStringIsLegal {
            return ("", false)
        }
        let newString = (string as NSString).replacingCharacters(in: range, with: string)
        let components = newString.components(separatedBy: CharacterSet(charactersIn: "0123456789").inverted)

        let decimalString = components.joined(separator: "") as NSString
        let length = decimalString.length
        let hasLeadingOne = length > 0 && decimalString.character(at: 0) == (1 as unichar)

        if length == 0 || (length > 16 && !hasLeadingOne) || length > 19 {
            let newLength = (string as NSString).length + (string as NSString).length - range.length as Int

            return ("", (newLength > 16) ? false : true)
        }
        var index = 0 as Int
        let formattedString = NSMutableString()

        if hasLeadingOne {
            formattedString.append("1 ")
            index += 1
        }
        if length - index > 4 {
            let prefix = decimalString.substring(with: NSMakeRange(index, 4))
            formattedString.appendFormat("%@-", prefix)
            index += 4
        }
        if length - index > 4 {
            let prefix = decimalString.substring(with: NSMakeRange(index, 4))
            formattedString.appendFormat("%@-", prefix)
            index += 4
        }
        if length - index > 4 {
            let prefix = decimalString.substring(with: NSMakeRange(index, 4))
            formattedString.appendFormat("%@-", prefix)
            index += 4
        }
        let remainder = decimalString.substring(from: index)
        formattedString.append(remainder)
        return (formattedString as String, false)
    }

    func textFieldCheckBackSpace(string: String, range: NSRange) -> String {
        var resultString = ""
        if let char = string.cString(using: String.Encoding.utf8) {
            let isBackSpace = strcmp(char, "\\b")
            if isBackSpace == -92 {
                debugPrint("Backspace was pressed")
                resultString =  ""
                self.text = ""
            } else {
                let text: NSString = (self.text ?? "") as NSString
                resultString = text.replacingCharacters(in: range, with: string)
            }
        } else {
            let text: NSString = (self.text ?? "") as NSString
            resultString = text.replacingCharacters(in: range, with: string)
        }
        return resultString
    }
}
