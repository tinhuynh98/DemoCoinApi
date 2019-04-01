//
//  APIResponse.swift
//  CoinMarket
//
//  Created by Toof on 5/20/18.
//  Copyright © 2018 Toof_Appsia. All rights reserved.
//

import Foundation
import Alamofire

extension Request {
    static func responseJSONSerializer(log: Bool = true,
                                       response: HTTPURLResponse?,
                                       data: Data?,
                                       error: Error?) -> Result<Any> {
        guard let response = response else {
            return .failure(NSError(status: .noResponse))
        }
        
        if let error = error {
            return .failure(error)
        }
        
        let status = response.statusCode
        
        if 204...205 ~= status {
            return .success([:]) // No Content
        }
        
        guard 200...299 ~= status else {
            var err: NSError!
            if let json = data?.toJSON() as? JSObject,
                let errors = json["errors"] as? JSArray,
                !errors.isEmpty,
                let message = errors[0]["value"] as? String {
                err = NSError(message: message)
            }
            else if let status = HTTPStatus(code: status) {
                err = NSError(domain: APIEndPoint.Category.baseURL.host!, code: status.rawValue)
            }
            else {
                err = NSError(domain: APIEndPoint.Category.baseURL.host,
                              code: status,
                              message: "Unknown HTTP status code received (\(status)).")
            }
            
            return .failure(err)
        }
        
        guard let data = data, let json = data.toJSON() else {
            return .failure(APIError.json)
        }
        
        return .success(json)
    }
    
}
