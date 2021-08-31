//
//  Utilities.swift
//  Kings Court
//
//  Created by gwl on 27/10/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
class Utilities: NSObject {
    static var viewControllerInstance: AnyObject!
    static var sharedInstance = Utilities()

    class func backButton(_ sender: UIViewController) {
        viewControllerInstance = sender
        let backBtn: UIButton = UIButton(type: .custom)
        backBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let backBtnImage = UIImage(named: "back")
        backBtn.setImage(backBtnImage, for: UIControl.State())
        backBtn.addTarget(self, action: #selector(Utilities.goback), for: UIControl.Event.touchUpInside)
        let backButton: UIBarButtonItem = UIBarButtonItem(customView: backBtn)
        ((viewControllerInstance as? UIViewController))?.navigationItem.leftBarButtonItem = backButton
    }
    @objc class func goback() {
        ((viewControllerInstance as? UIViewController))?.navigationController?.popViewController(animated: true)
    }

    class func setNavigationTitleInTwoLines(firstLineText: String, secondLineText: String) {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .white
        let mutableAttributedString = NSMutableAttributedString()
        let stringAttributesFirst = [
            NSAttributedString.Key.font: UIFont.navigationTitleFirstLine
        ] as [NSAttributedString.Key: Any]
        let atrributedStringOne = NSAttributedString(string: firstLineText, attributes: stringAttributesFirst)
        let stringAttributesSecond = [
            NSAttributedString.Key.font: UIFont.navigationTitleSecondLine] as [NSAttributedString.Key: Any]
        let atrributedStringTwo = NSAttributedString(string: secondLineText,
                                                     attributes: stringAttributesSecond)
        mutableAttributedString.append(atrributedStringOne)
        mutableAttributedString.append(atrributedStringTwo)
        label.attributedText = mutableAttributedString
        ((viewControllerInstance as? UIViewController))?.navigationController?.navigationItem.titleView = label
    }
}
