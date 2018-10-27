//
//  Network.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 27/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import Alamofire


enum AlamofireRouter: URLRequestConvertible {
    
    case login(email: String, password: String)
    case getUserProfile
    case loadDessert(city_id: String)
    
    
    var path: String {
        switch self {
        case .login:
            return "/auth/login/withEmail"
        case .getUserProfile:
            return "/courses/500px/list"
        case .loadDessert:
            return "/api/v2.1/collections"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getUserProfile:
            return .get
        case .loadDessert:
            return .post
        }
    }
    
    public var parameters: [String: Any]? {
        switch self {
        case .login(let email, let password):
            return [
                "email": email,
                "password": password
            ]
        case .getUserProfile:
            return nil
        case .loadDessert(let city_id):
            return [
                "city_id": city_id
            ]
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let baseURLString = "https://nuuneoi.com"
        let url = URL(string: baseURLString + path)!
        var mutableURLRequest = URLRequest(url: url)
        mutableURLRequest.httpMethod = method.rawValue
        
        return try Alamofire.JSONEncoding.default.encode(mutableURLRequest, with: parameters)
    }
}
