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
        dessertListViewModel.city_id.onNext("1")
        
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
                self.alertError(message: error)
            }).disposed(by: disposeBag)
    }
    private func alertError(message: String?) {
        if message != nil && message != "" {
            let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    // MARK: - Life cycle
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destVC = segue.destination as? DetailViewController,
            let cell = sender as? DessertCell {
//            destVC.detaildessertViewmodel = DessertViewModel(dessertViewmodel: self.dessertListViewModel.dessertList.value)
        }
    }
}

