//
//  Quote.swift
//  Demo
//
//  Created by Toof on 5/12/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import Foundation
import ObjectMapper

struct Quote: Mappable {
    var price: Double?
    var volume24h: Double?
    var marketCap: Double?
    var percentChange1h: Double?
    var percentChange24h: Double?
    var percentChange7d: Double?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        price               <- map["price"]
        volume24h           <- map["volume_24h"]
        marketCap           <- map["market_cap"]
        percentChange1h     <- map["percent_change_1h"]
        percentChange24h    <- map["percent_change_24h"]
        percentChange7d     <- map["percent_change_7d"]
    }
    
}
