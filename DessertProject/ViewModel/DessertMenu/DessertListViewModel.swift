//
//  DessertListViewModel.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 3/11/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import RxSwift
//protocol DessertCellModeling {
//    var image: Observable<UIImage> { get }
//
//}
class DessertListViewModel{
    
    private var dessert: DessertService
    var loading = Variable<Bool>(false)
    var errorMessage = Variable<String?>(nil)
    let city_id = PublishSubject<String>()
    private let disposeBag = DisposeBag()
    // Output
    var dessertList = Variable<[Collections]>([])
    
    init(service: DessertService) {
        
        dessert = service
        
        city_id.subscribe(onNext: { (id) in
            self.loadDessertlists(city_id: id)
                .subscribe()
                .disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
    }
    
    
    public func loadDessertlists(city_id: String) -> Observable<Result<Collections>?> {
        return dessert.getDessert(for: city_id)
            .do(onNext: { (result) in
                if let data = result?.data {
                    self.dessertList.value = data
                }
            }, onError: { (error) in
                self.errorMessage.value = NSLocalizedString("errorMessage", comment: "")
            })
    }
}
