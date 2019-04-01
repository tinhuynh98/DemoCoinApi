//
//  Network.swift
//  CoinMarket
//
//  Created by Toof on 5/20/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import Foundation
import Alamofire

typealias Network = NetworkReachabilityManager

extension Network {
    static let shared: Network = {
        guard let manager = Network() else {
            fatalError("Cannot alloc network reachability manager!")
        }
        return manager
    }()
    
}
