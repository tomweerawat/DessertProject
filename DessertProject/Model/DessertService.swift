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
    public var dataResp:[Collections]?
    
    public func getDessert(for city_id: String) -> Observable<Result<Collections>?>{
        let router = AlamofireRouter.loadDessert(city_id: city_id)
        return RxAlamofire.requestJSON(router)
            .map {(r,json)in Mapper<Result<Collections>>().map(JSONObject: json) }
    }

//    public func getDessert(for city_id: String) ->() {
//        let router = AlamofireRouter.loadDessert(city_id: "1")
//        RxAlamofire.requestJSON(router).subscribe(onNext: {(r, value) in
//            let json = JSON(value)
//            let collections = json["collections"]
//            if let respData = collections.arrayObject {
//                self.dataResp = Mapper<Collections>().mapArray(JSONObject: respData)
//                print(self.dataResp?.count as Any)
//            }
//            }, onError: { error in
//                print(error)
//        }).disposed(by: disposeBag)
//
//    }


    
}
