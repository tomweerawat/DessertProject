//
//  PathUrl.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 27/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import Alamofire

extension AlamofireRouter {
    
    public var path: String {
        switch self {
        case .login:
            return "/auth/login/withEmail"
        case .loadPhoto:
            return "/courses/500px/list"
        case .loadDessert(let city_id):
            return "/api/v2.1/collections?city_id=\(city_id)"
        }
    }
}
