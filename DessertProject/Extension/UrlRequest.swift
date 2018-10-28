//
//  UrlRequest.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 27/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import Alamofire

extension AlamofireRouter{
    
    public func asURLRequest() throws -> URLRequest {
        let url = URL(string: baseURLString + path)!
        let encoding = Alamofire.JSONEncoding.default
        var mutableURLRequest = URLRequest(url: url)
        mutableURLRequest.httpMethod = method.rawValue
        mutableURLRequest.httpBody = rawBody as Data
        setHttpHeaders(&mutableURLRequest, headers: headers)
        mutableURLRequest = try encoding.encode(mutableURLRequest, with: parameters)
        return mutableURLRequest
    }
    
}
