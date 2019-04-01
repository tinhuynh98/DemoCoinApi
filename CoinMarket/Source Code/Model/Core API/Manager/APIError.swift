//
//  Error.swift
//  CoinMarket
//
//  Created by Toof on 5/20/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import Foundation

struct APIError {
    static let network = NSError(domain: NSCocoaErrorDomain, message: "The internet connection appears to be offline.")
    static let json = NSError(domain: NSCocoaErrorDomain, code: 3_840, message: "The operation couldn’t be completed.")
}
