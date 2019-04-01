//
//  APIManager.swift
//  CoinMarket
//
//  Created by Toof on 5/20/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import Foundation
import Alamofire

typealias Completion = (Result<Any>) -> Void

final class APIManager {
    var request: DataRequest!
    
    @discardableResult
    func request(urlString: String, method: HTTPMethod, parameter: Parameters? = nil, header: HTTPHeaders? = nil, completion: @escaping Completion) -> Request? {
        
        guard Network.shared.isReachable else {
            completion(.failure(APIError.network))
            return nil
        }
        
        var encoder: ParameterEncoding!
        if method == .post {
            encoder = JSONEncoding.default
        }
        else {
            encoder = URLEncoding.default
        }
        
        self.request = Alamofire.request(urlString,
                          method: method,
                          parameters: parameter,
                          encoding: encoder,
                          headers: header)
            .responseJSON { (dataResponse) in
                switch dataResponse.result {
                case .success(let value):
                    break
                case .failure(let error):
                    break
                }
        }
        return self.request
    }
    
}
