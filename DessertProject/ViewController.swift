//
//  ViewController.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 27/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {


    @IBAction func loginBtn(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        login();
    }

    func login() {
        let router = AlamofireRouter.getUserProfile
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

