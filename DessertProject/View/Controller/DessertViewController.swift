//
//  DessertViewController.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import Alamofire
import AlamofireImage
class DessertViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var respPhoto:[Dessert]?
    override func viewDidLoad() {
        super.viewDidLoad()
        login(city_id: "1")
       
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return respPhoto?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DessertCell", for: indexPath) as! TestCell
        Alamofire.request("https://httpbin.org/image/png").responseImage { response in
            if let image = response.result.value{
                cell.dessertImageView?.image = image
            }
            }
          return cell
    }
    func login(city_id: String) {
        let router = AlamofireRouter.loadDessert(city_id: city_id)
        Alamofire.request(router).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
