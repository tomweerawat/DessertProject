//
//  Dessert.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import ObjectMapper

class Result<T: BaseMappable>: Mappable{
    
    var checksum: String?
    var data: [T]?
    var total: Int?
    
    init() {}
    required convenience init?(map: Map) { self.init() }
    
    func mapping(map: Map) {
        checksum    <- map["checksum"]
        data        <- map["data"]
        total       <- map["total"]
    }
    
}
