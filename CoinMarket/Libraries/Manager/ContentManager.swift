//
//  ContentManager.swift
//  CoinMarket
//
//  Created by Toof on 3/25/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import Foundation

final class ContentManager {
    
    static var shared: ContentManager = ContentManager()
    var stringCache: [String: String]
    
    init() {
        self.stringCache = [String: String]()
    }
    
    func stringForKey(_ key: String) -> String! {
        var string = self.stringCache[key]
        if string == nil {
            string = Bundle.main.localizedString(forKey: key, value: nil, table: nil)
            self.stringCache[key] = string
        }
        return string
    }
    
}

