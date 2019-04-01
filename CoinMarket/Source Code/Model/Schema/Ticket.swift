//
//  Ticket.swift
//  Demo
//
//  Created by Toof on 5/12/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import Foundation
import ObjectMapper

struct Ticket: Mappable {
    var id: Int!
    var name: String            = ""
    var symbol: String          = ""
    var websiteSlug: String     = ""
    var rank: Int               = 0
    var circulatingSupply: Double?
    var totalSupply: Double?
    var maxSupply: Double?
    var quotes: Array<Quote> = Array<Quote>()
    
    init?(map: Map) {
//        self.init(map: map)
    }
    
    mutating func mapping(map: Map) {
        id                  <- map["id"]
        name                <- map["name"]
        symbol              <- map["symbol"]
        websiteSlug         <- map["website_slug"]
        rank                <- map["rank"]
        circulatingSupply   <- map["circulating_supply"]
        totalSupply         <- map["total_supply"]
        maxSupply           <- map["max_supply"]
        quotes              <- (map["quotes"], ArrayTranform<Quote>())
    }
    
}

class ArrayTranform<T: Mappable>: TransformType {
    typealias Object = Array<T>
    typealias JSON = JSObject
    
    func transformFromJSON(_ value: Any?) -> Array<T>? {
        var quotes: Array<T> = Array<T>()
        if let jsObjects = value as? JSObject {
            for (_, value) in jsObjects {
                if  let object = value as? JSObject, let quote = Mapper<T>().map(JSON: object) {
                    quotes.append(quote)
                }
            }
        }
        return quotes
    }
    
    func transformToJSON(_ value: Array<T>?) -> JSObject? {
        return nil
    }
    
}
