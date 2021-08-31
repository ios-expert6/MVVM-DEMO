//
//  StyleTheam.swift
//  Kings Court
//
//  Created by gwl on 15/10/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    // MARK: Colors
    static let disableColor = UIColor(red: 46/255, green: 46/255, blue: 53/255, alpha: 1)
    static let enableColor = UIColor(red: 0.03, green: 0.11, blue: 0.24, alpha: 1.00)
    static let loginColor = UIColor(red: 0.09, green: 0.63, blue: 0.52, alpha: 1.00)    
    static let shadowColor = UIColor(red: 0.12, green: 0.33, blue: 0.76, alpha: 1.00)
    static let placeHolderColor = UIColor(red: 188/255, green: 188/255, blue: 194/255, alpha: 1)
    static let textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    static let errorColor = UIColor(red: 255/255, green: 46/255, blue: 46/255, alpha: 1)
    static let disableButton = UIColor(red: 188/255, green: 188/255, blue: 194/255, alpha: 1)
    static let imageBorderColor  = UIColor(red: 188/255, green: 188/255, blue: 194/255, alpha: 1)
    static let viewBorderColor = UIColor.init(red: 46/225, green: 46/225, blue: 53/225, alpha: 1)
    static let buttonGreenBorderColor  = UIColor(red: 24/255, green: 169/255, blue: 142/255, alpha: 1)
    static let warmGreyGreyColor  = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
    static let charcoalGreyColor  = UIColor(red: 46/255, green: 46/255, blue: 53/255, alpha: 1)
    static let pendingColor = UIColor(red: 210/255, green: 164/255, blue: 83/255, alpha: 1)
    static let cancelledColor = UIColor(red: 217/255, green: 47/255, blue: 46/255, alpha: 1)
    static let userImageBorderColor = UIColor.init(red: 188/255, green: 188/255, blue: 194/255, alpha: 1)
    static let bgColor = UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1)
    static let transparentGreenColor = UIColor.init(red: 24/225, green: 169/225, blue: 142/225, alpha: 0.4)
    static let bgColorForCount = UIColor.init(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
    static let pageControlUnselectedColor = UIColor.init(red: 76/255, green: 76/255, blue: 81/255, alpha: 1.0)
}
extension UIFont {
    static let poppins = "Poppins"
    private static func poppins(_ weight: PoppinsWeight, size: CGFloat) -> UIFont {
        return UIFont(name: poppins + "-" +  weight.rawValue, size: size) ?? UIFont()
    }
    static let menuStripTitle = UIFont.poppins(.regular, size: 17)
    static let navigationTitleFirstLine = UIFont.poppins(.medium, size: 15)
    static let navigationTitleSecondLine = UIFont.poppins(.regular, size: 12)
    static let textViewFont = UIFont.poppins(.regular, size: 15)
    static let inviteViewFont = UIFont.poppins(.regular, size: 18)
    static let textAreaErrorFont = UIFont.poppins(.regular, size: 11)
    enum PoppinsWeight: String {
        case semiBold = "SemiBold"
        case bold = "Bold"
        case regular = "Regular"
        case medium = "Medium"
    }
    var pxSize: String {
        return String(Int(pointSize)) + "px"
    }
}
