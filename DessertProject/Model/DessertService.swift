//
//  DessertService.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 3/11/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import UIKit
import RxSwift
import RxAlamofire
import ObjectMapper
import Alamofire
import SwiftyJSON
import AlamofireObjectMapper

class DessertService: NSObject {
    
    private let disposeBag = DisposeBag()
    private let router = AlamofireRouter.loadPhoto
    public var dataResp:[Collections]?
    
    public func getDessert(for city_id: String) -> Observable<Result<Collections>?>{
        return RxAlamofire.request(router)
            .map {(json)in Mapper<Result<Collections>>().map(JSONObject: json) }
    }

   


    
}
