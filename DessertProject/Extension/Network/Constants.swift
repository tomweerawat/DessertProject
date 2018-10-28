//
//  Constants.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation

struct K {
    struct ProductionServer {
        static let baseURL = "https://developers.zomato.com"
    }
    
    struct APIParameterKey {
        static let password = "password"
        static let email = "email"
        static let city_id = "city_id"
       
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
