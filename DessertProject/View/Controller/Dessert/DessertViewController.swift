//
//  DessertViewController.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//
import UIKit
import SDWebImage
import Alamofire
import AlamofireImage
import AlamofireObjectMapper
import ObjectMapper
import SwiftyJSON
import RxSwift
import RxAlamofire

class DessertViewController:UIViewController {
   
    private let disposeBag = DisposeBag()
    internal var dessertListViewModel: DessertListViewModel!
    
    @IBOutlet weak var tableViewLoad: UITableView!
    
    override func viewDidLoad() {
        self.title = NSLocalizedString("Menu", comment: "")
        
        dessertListViewModel = DessertListViewModel(service: DessertService())
        bind(viewModel: dessertListViewModel)
    }
    
    private func bind(viewModel: DessertListViewModel?) {
        viewModel?.dessertList.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe({ (result) in
                self.tableViewLoad.reloadData()
            }).disposed(by: disposeBag)
        
        viewModel?.errorMessage.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (error) in
//                self.alertError(message: error)
            }).disposed(by: disposeBag)
    }
}

