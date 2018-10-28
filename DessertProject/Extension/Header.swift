//
//  Header.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 27/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import Alamofire

extension AlamofireRouter {
    
    public var headers: [String: String]? {
        switch self {
        default:
            return nil
        }
    }
    
    public func setHttpHeaders(_ mutableURLRequest: inout URLRequest, headers: [String: String]?) {
        addDefaultHttpHeader(&mutableURLRequest)
        if let headers = headers {
            for each in headers.keys {
                mutableURLRequest.setValue(headers[each], forHTTPHeaderField: each)
            }
        }
    }
    
    private func addDefaultHttpHeader(_ mutableURLRequest: inout URLRequest) {
        
        mutableURLRequest.setValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        
//        if let token = UserInfo.sharedInstance.user_key {
//            mutableURLRequest.setValue(token, forHTTPHeaderField: "x-access-token")
//        }
        let token = "7cd5f10c66378443bb51b7346136680c"
        
        mutableURLRequest.setValue(token, forHTTPHeaderField: "user-key")
    }
}
