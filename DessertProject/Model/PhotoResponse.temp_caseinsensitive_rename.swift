//
//  Photoresponse.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import ObjectMapper

class PhotoResponse: Mappable {
    var success: Bool?
    var data: [Data]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
    }
}

class Data: Mappable {
    
    var id: Int?
    var link: String?
    var imageURL: String?
    var caption: String?
    var userID: Int?
    var username: String?
    var profilePicture: String?
    var tags: [String]?
    var createdTime: Date?
    var camera: String?
    var lens: String?
    var focalLength: String?
    var iso: String?
    var shutterSpeed:String?
    var aperture: String?
    
    required init?(map: Map){
        
        link = ""
    }
    
    func mapping(map: Map) {
        
        id <- map["id"]
        link <- map["link"]
        imageURL <- map["image_url"]
        caption <- map["caption"]
        userID <- map["user_id"]
        username <- map["username"]
        profilePicture <- map["profile_picture"]
        tags <- map["tags"]
        createdTime <- map["createdTime"]
        camera <- map["camera"]
        lens <- map["lens"]
        focalLength <- map["focal_length"]
        iso <- map["iso"]
        shutterSpeed <- map["shutter_speed"]
        aperture <- map["aperture"]
    }
}
