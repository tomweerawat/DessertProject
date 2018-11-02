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
class DessertViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableViewLoad: UITableView!

    var dataResp:[Collections]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewLoad.dataSource = self
        tableViewLoad.delegate = self
        login(city_id: "1")
        //        onLoadData(city_id: "1")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DessertCell", for: indexPath) as! TestCell
        cell.nameLabel.text =  dataResp?[indexPath.row].collection?.title
        cell.locationNameLabel.text =  dataResp?[indexPath.row].collection?.description
        Alamofire.request((dataResp?[indexPath.row].collection?.image_url)!).responseImage { response in
            if let image = response.result.value{
                cell.thumbnailImageView?.image = image
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataResp?.count ?? 0
        
    }
    
    func login(city_id: String) {
        let router = AlamofireRouter.loadDessert(city_id: city_id)
        Alamofire.request(router).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let switftyJsonVar = JSON(value)
                let collections = switftyJsonVar["collections"]
                if let respData = collections.arrayObject {
                    self.dataResp = Mapper<Collections>().mapArray(JSONObject: respData)
                    print(self.dataResp?.count as Any)
                    self.tableViewLoad.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    //    func onLoadData(city_id: String){
    //        let router = AlamofireRouter.loadDessert(city_id: city_id)
    //        Alamofire.request(router).responseArray(keyPath: "collections") { (response: DataResponse<[Collections]>) in
    //            switch response.result {
    //            case .success:
    //                self.dataResp = response.result.value ?? []
    //                self.tableView.reloadData()
    //                for project in self.dataResp {
    //
    //                    self.tableView.reloadData()
    //                }
    //            case .failure(let error):
    //                print(error)
    //            }
    //        }
    //    }
}

