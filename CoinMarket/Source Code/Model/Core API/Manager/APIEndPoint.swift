//
//  API.swift
//  CoinMarket
//
//  Created by Toof on 5/20/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import Foundation

struct APIEndPoint {
    struct Category {
        static let baseURL: String = "https://api.coinmarketcap.com/v2"
    }
    
}

extension APIEndPoint.Category {
    struct Listings {
        static var path: String { return baseURL + "/" + "listings" }
    }
    
    struct Ticker {
        static var path: String { return baseURL + "/" + "ticker" }
        let id: Int
        var urlString: String { return Ticker.path + "/" + "\(id)" }
    }
    
}

