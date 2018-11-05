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
        var url = URL(string: baseURLString + path)!
        switch self {
        case .loadPhoto:
            url = URL(string: baseURLPhoto + path)!;break
            
        case .login:
        url = URL(string: baseURLString + path)!;break
        case .loadDessert:
        url = URL(string: baseURLString + path)!;break
        }
        let encoding = Alamofire.JSONEncoding.default
        var mutableURLRequest = URLRequest(url: url)
        mutableURLRequest.httpMethod = method.rawValue
        mutableURLRequest.httpBody = rawBody as Data
        setHttpHeaders(&mutableURLRequest, headers: headers)
        mutableURLRequest = try encoding.encode(mutableURLRequest, with: parameters)
        return mutableURLRequest
    }
    
}
