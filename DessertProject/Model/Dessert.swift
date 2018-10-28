//
//  Dessert.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation

struct Dessert: Codable {
    let collections: [CollectionElement]
    let hasMore: Int
    let shareURL: String
    let displayText: String
    let hasTotal: Int
    
    enum CodingKeys: String, CodingKey {
        case collections
        case hasMore = "has_more"
        case shareURL = "share_url"
        case displayText = "display_text"
        case hasTotal = "has_total"
    }
}

struct CollectionElement: Codable {
    let collection: CollectionCollection
}

struct CollectionCollection: Codable {
    let collectionID, resCount: Int
    let imageURL: String
    let url: String
    let title, description: String
    let shareURL: String
    
    enum CodingKeys: String, CodingKey {
        case collectionID = "collection_id"
        case resCount = "res_count"
        case imageURL = "image_url"
        case url, title, description
        case shareURL = "share_url"
    }
}
