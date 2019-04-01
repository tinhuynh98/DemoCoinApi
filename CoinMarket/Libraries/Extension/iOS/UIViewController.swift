//
//  UIViewController.swift
//  CoinMarket
//
//  Created by Toof_Appsia on 3/14/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import UIKit

extension UIViewController {
    
    open class func initFromNIB() -> Self {
        return self.init(nibName: String(describing: self), bundle: nil)
    }
    
    func show(alert: UIAlertController) {
        guard let _ = self.presentedViewController else {
            self.present(alert, animated: true, completion: nil)
            return
        }
    }
    
    func alert(with title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
    }
    
}
