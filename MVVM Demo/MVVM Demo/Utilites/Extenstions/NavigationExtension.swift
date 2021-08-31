//
//  NavigationExtension.swift
//  Kings Court
//
//  Created by gwl on 30/10/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
extension UINavigationItem {
    func setNavigationTitleInTwoLines(title: String, subtitle: String) {
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
        let atrributedStringOne = NSAttributedString(string: title, attributes: stringAttributesFirst)
        let stringAttributesSecond = [
            NSAttributedString.Key.font: UIFont.navigationTitleSecondLine] as [NSAttributedString.Key: Any]
        let atrributedStringTwo = NSAttributedString(string: subtitle,
                                                     attributes: stringAttributesSecond)
        mutableAttributedString.append(atrributedStringOne)
        mutableAttributedString.append(atrributedStringTwo)
        label.attributedText = mutableAttributedString
        self.titleView = label
    }
}
