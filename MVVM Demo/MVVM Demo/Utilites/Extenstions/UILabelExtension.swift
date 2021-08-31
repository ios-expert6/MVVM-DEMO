//
//  UILabelExtension.swift
//  Kings Court
//
//  Created by gwl on 04/12/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
extension UILabel {
    func setLabelCornerRadius(radius: CGFloat, boarderWidth: Double, boarderColor: UIColor) {
        layer.cornerRadius = radius
        layer.borderWidth = CGFloat(boarderWidth)
        layer.borderColor = boarderColor.cgColor
    }
}
