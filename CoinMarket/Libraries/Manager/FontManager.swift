//
//  FontManager.swift
//  CoinMarket
//
//  Created by Toof on 3/25/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import UIKit

enum FontType : String {
    case Light            = "-Light"
    case Medium           = "-Medium"
    case Regular          = "-Regular"
    case None             = ""
}

enum FontSize: CGFloat {
    case Extra          = 34.0
    case Big            = 24.0
    case Normal         = 20.0
    case Small          = 18.0
    case Tiny           = 16.0
    case None           = 12.0
}

enum FontName : String {
    case Heebo = "Heebo"
}

enum FontScale: CGFloat {
    case iPhone = 1.0
    case iPad = 1.135
}

let fontScale: FontScale = ((UIDevice.current.userInterfaceIdiom == .phone
    ) ? .iPhone : .iPad)

extension UIFont {
    
    class func font(_ name: FontName, type: FontType, size: FontSize) -> UIFont! {
        let fontName = name.rawValue + type.rawValue
        let fontSize = size.rawValue * fontScale.rawValue
        let font = UIFont(name: fontName, size: fontSize)
        if let font = font {
            return font
        } else {
            return UIFont.systemFont(ofSize: fontSize)
        }
    }
    
    // Custom With Font Size 12 16 18 20 24 34
    class var heeboMediumExtraFont: UIFont {
        return UIFont.font(.Heebo, type: .Medium, size: .Extra)
    }

    class var heeboMediumFont: UIFont {
        return UIFont.font(.Heebo, type: .Medium, size: .None)
    }
    
}

