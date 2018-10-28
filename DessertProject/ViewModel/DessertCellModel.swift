//
//  DessertCellModel.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol DessertCellModeling {
    var image: Observable<UIImage> { get }
  
}
class DessertCellModel: DessertCellModeling {
    
    let image: Observable<UIImage>
    
    init(network: Networking, imageUrl: String) {
        let placeholder = #imageLiteral(resourceName: "user2")
        self.image = Observable.just(placeholder)
            .concat(network.image(url: imageUrl))
            .observeOn(MainScheduler.instance)
            .catchErrorJustReturn(placeholder)
       
    }
}
