//
//  Protocal.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import Alamofire

public protocol AlamofireRouterProtocol: URLRequestConvertible {
    
    var baseURLString: String { get }
    var path: String { get }
    var method: Alamofire.HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var rawBody: NSData { get }
}
