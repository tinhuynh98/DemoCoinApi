//
//  UILabel.swift
//  CoinMarket
//
//  Created by Toof on 3/31/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setAttributedTextWith(string: String, font: UIFont, textColor: UIColor = UIColor.white, spacing: CGFloat) {
        let attributedString = NSMutableAttributedString(string: string, attributes: [
            .font: font,
            .foregroundColor: textColor,
            .kern: spacing
            ])
        self.attributedText = attributedString
    }
    
}
