//
//  ButtonProperty.swift
//  Kings Court
//
//  Created by gwl on 19/10/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
class EnableButton: UIButton {
     var enable: Bool = true {
        didSet {
            layer.cornerRadius = 25
            if enable {
                backgroundColor = .loginColor
                isUserInteractionEnabled = true
            } else {
                backgroundColor = .disableButton
                isUserInteractionEnabled = false
            }
        }
    }
}

class FieldAvailableButton: UIButton {
     var enable: Bool = true {
        didSet {
            layer.cornerRadius = 5
            if enable {
                backgroundColor = .transparentGreenColor
                setTitleColor(.white, for: .normal)
                isSelected = true
            } else {
                backgroundColor = .clear
                setTitleColor(.buttonGreenBorderColor, for: .normal)
                isSelected = false
            }
        }
    }
}
