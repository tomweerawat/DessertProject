//
//  Method.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 27/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import Alamofire

extension AlamofireRouter {
    
    public var method: Alamofire.HTTPMethod {
        switch self {
            
        case .login:
            return .post
        case .loadPhoto:
            return .get
        case .loadDessert:
             return .post
        }
    }
}
