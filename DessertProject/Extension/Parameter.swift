//
//  Parameter.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation

extension AlamofireRouter {
    
    public var parameters: [String: Any]? {
        switch self {
        case .login(let email, let password):
            return [
                "email": email,
                "password": password
            ]
        case .loadPhoto:
            return nil
        case .loadDessert(let city_id):
            return [
                "city_id": city_id
            ]
        }
    }

}
