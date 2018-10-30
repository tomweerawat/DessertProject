//
//  DessertMapper.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 29/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import ObjectMapper

class DessertMapper: Mappable {
  
    var collections: [DessertDao]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        collections <- map["collection"]
    }
}

class DessertDao: Mappable {
    var title: String?
    var image_url: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        image_url <- map["image_url"]
    
    }
}
