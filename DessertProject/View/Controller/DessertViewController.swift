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
import ObjectMapper
import SwiftyJSON
class DessertViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var respPhoto:[DessertDao]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        login(city_id: "1")
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DessertCell", for: indexPath) as! TestCell
        cell.tittleLabel.text =  respPhoto?[indexPath.row].title
//         cell.backgroundColor = UIColor.green
        
        return cell
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return respPhoto?.count ?? 0
    }

    func login(city_id: String) {
        let router = AlamofireRouter.loadDessert(city_id: city_id)
        Alamofire.request(router).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                
//                  self.respPhoto = Mapper<DessertDao>().mapArray(JSONObject: value)
//                let switftyJsonVar = JSON(value)
//                if let respData = switftyJsonVar["collections"].arrayObject {
//                    self.respPhoto = Mapper<DessertDao>().mapArray(JSONObject: respData)
//                    self.tableView.reloadData()
//                }
                let switftyJsonVar = JSON(value)
                let collections = switftyJsonVar["collections"]
                if let respData = collections.arrayObject {
                self.respPhoto = Mapper<DessertDao>().mapArray(JSONObject: respData)
                
                    
                     print(respData)
                   
                    
                }
                
//                for newCollectiom in collections {
//
//                self.respPhoto = Mapper<DessertDao>().mapArray(JSONObject: newCollectiom)
//
//                }
//                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
