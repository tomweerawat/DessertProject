//
//  Dessert.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import ObjectMapper

class Result<T: Mappable>: Mappable{
    
    var data : [T]?
    var has_more : Int?
    var share_url : String?
    var display_text : String?
    var has_total : Int?
    
    init() {}
    required convenience init?(map: Map) { self.init() }
    
    func mapping(map: Map) {
        data        <- map["collections"]
        has_more    <- map["has_more"]
        share_url   <- map["share_url"]
        display_text <- map["display_text"]
        has_total <- map["has_total"]
    }
    
}
