//
//  UITextViewExtension.swift
//  Kings Court
//
//  Created by gwl on 29/12/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
extension UITextView {
    func setMaximumTextViewLength(range: NSRange, string: String, maxLength: Int) -> Bool {
        let currentString: NSString = (self.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}
