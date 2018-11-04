//
//  DessertViewModel.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 3/11/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import RxSwift

class DessertViewModel {
    
    var dessertViewmodel = Variable<Collections?>(nil)
    var formattedDuration = Variable<String>("")
    
    init(dessertViewmodel: Collections) {
        self.dessertViewmodel.value = dessertViewmodel
//        self.formattedDuration.value = Utils.durationString(from: playlist.duration, style: .full)
    }
    
}
