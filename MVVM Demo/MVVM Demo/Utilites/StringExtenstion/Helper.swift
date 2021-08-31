//
//  Helper.swift
//  Kings Court
//
//  Created by gwl on 22/09/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
// MARK: - String Extention
extension String {
    // Returns true if the string has at least one character in common with matchCharacters.
    func containsCharactersIn(_ matchCharacters: String) -> Bool {
        let characterSet = CharacterSet(charactersIn: matchCharacters)
        return self.rangeOfCharacter(from: characterSet) != nil
    }
    // Returns true if the string contains only characters found in matchCharacters.
    func containsOnlyCharactersIn(_ matchCharacters: String) -> Bool {
        let disallowedCharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
    }
    // Returns true if the string has no characters in common with matchCharacters.
    func doesNotContainCharactersIn(_ matchCharacters: String) -> Bool {
        let characterSet = CharacterSet(charactersIn: matchCharacters)
        return self.rangeOfCharacter(from: characterSet) == nil
    }
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    func isValidPassword() -> Bool {
        if self.components(separatedBy: CharacterSet.whitespacesAndNewlines).count > 1 {
            return false
        }
        return true
    }
    func isValidPasswordLength() -> Bool {
        if self.count > 7 {
            return true
        }
        return false
    }
    func isValidUserNameLength() -> Bool {
        if self.count > 2 {
            return true
        }
        return false
    }
    func isMatchConfirmPassword(_ password: String) -> Bool {
        return (password == self)
    }
    func trimmedString() -> String {
        return (self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
    }
    func isValidURL() -> Bool {
        let urlRegEx = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+"
        let urlText = NSPredicate(format: "SELF MATCHES %@", urlRegEx)
        return urlText.evaluate(with: self)
    }
    func isValidName() -> Bool {
        let nameRegEx = "[a-zA-z.\\s]+([ '-][a-zA-Z]+)*$"
        let nameText = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        return nameText.evaluate(with: self)
    }
    func isValidUserName() -> Bool {
        let usernameRegEx = "^(?=.{1,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$"
        let userTest = NSPredicate(format: "SELF MATCHES %@", usernameRegEx)
        return userTest.evaluate(with: self)
    }
    func isValidZipcode() -> Bool {
        let zipRegEx = "([0-9]{6}|[0-9]{3}\\s[0-9]{3})"
        let zipText = NSPredicate(format: "SELF MATCHES %@", zipRegEx)
        return zipText.evaluate(with: self)
    }
    func isValidPhoneNumber() -> Bool {
        let phoneRegEx = "^+(?:[0-9] ?){6,14}[0-9]$"
        let phoneText = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return phoneText.evaluate(with: self)
    }
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
    // Added by Rahul to get width of string
    func widthWithConstrainedHeight(_ height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.width
    }
    func setTextFieldAcceptAlphabatOnly() -> Bool {
        let allowedCharacters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢"
        let allowedCharacterSet = CharacterSet(charactersIn: allowedCharacters)
        let typedCharacterSet = CharacterSet(charactersIn: self)
        let alphabet = allowedCharacterSet.isSuperset(of: typedCharacterSet)
        return alphabet
    }
    func hiddeEmailId() -> String {
        let second = String(self.prefix(2))
        let token = self.components(separatedBy: "@")
        let newQuery = String(repeating: "*", count: token[0].count)  // check array length before using index
        let replaceCharacters = newQuery.replacingCharacters(in: ...newQuery.startIndex, with: second)
        return replaceCharacters + "@" +  token[1]
    }
    func getUnderlineText() -> NSMutableAttributedString {
        let textRange = NSMakeRange(0, self.count)
        let attributedText = NSMutableAttributedString(string: self)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle,
                                    value: NSUnderlineStyle.single.rawValue,
                                    range: textRange)
        // Add other attributes if needed
        return attributedText
    }
    func getFormatedDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "MMM d , yyyy"
        return  dateFormatter.string(from: date!)
    }
    func getFormatedForTransactions() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "d MMMM yyyy"
        return  dateFormatter.string(from: date!)
    }
    func getDateFromString() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        //        dateFormatter.dateFormat = "d MMM, yyyy"
        return date
    }
    func getFormatedForOwnerCalender() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "d MMM, yyyy"
        return  dateFormatter.string(from: date!)
    }
    func getFormatedForGames() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "MMMM dd"
        return  dateFormatter.string(from: date!)
    }
    func getDayOfWeek() -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: self) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
    func getfloatValue() -> Float {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let number = numberFormatter.number(from: self.trimmingCharacters(in: .whitespacesAndNewlines)) else { return 0.0 }
        return Float(exactly: number) ?? 0.0
    }
}
extension Double {
    func currencyFormatter(uptoDecimal: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.decimalSeparator = "."
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = uptoDecimal
        numberFormatter.maximumFractionDigits = uptoDecimal
        return numberFormatter.string(from: self as NSNumber) ?? "\(0.0)"
    }
}
extension UITapGestureRecognizer {
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        guard let attributedString = label.attributedText else { fatalError("Not able to fetch attributed string.") }
        var offsetXDivisor: CGFloat
        switch label.textAlignment {
        case .center: offsetXDivisor = 0.5
        case .right: offsetXDivisor = 1.0
        default: offsetXDivisor = 0.0
        }
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: .zero)
        let textStorage = NSTextStorage(attributedString: attributedString)
        let labelSize = label.bounds.size
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        textContainer.size = labelSize
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        let offsetX = (labelSize.width - textBoundingBox.size.width) * offsetXDivisor - textBoundingBox.origin.x
        let offsetY = (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y
        let textContainerOffset = CGPoint(x: offsetX, y: offsetY)
        let locationTouchX = locationOfTouchInLabel.x - textContainerOffset.x
        let locationTouchY = locationOfTouchInLabel.y - textContainerOffset.y
        let locationOfTouch = CGPoint(x: locationTouchX, y: locationTouchY)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouch, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
extension URL {
    /// Returns a new URL by adding the query items, or nil if the URL doesn't support it.
    /// URL must conform to RFC 3986.
    func appendingItems(_ queryItems: [URLQueryItem]) -> URL? {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            // URL is not conforming to RFC 3986 (maybe it is only conforming to RFC 1808, RFC 1738, and RFC 2732)
            return nil
        }
        // append the query items to the existing ones
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems

        // return the url from new url components
        return urlComponents.url
    }
}
