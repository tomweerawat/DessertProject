//
//  DessertDataSource.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 3/11/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import Foundation
import UIKit

extension DessertViewController: UITableViewDataSource {

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dessertListViewModel.dessertList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DessertCell.reuseIdentifier, for: indexPath) as! DessertCell
        let dessertlist = dessertListViewModel.dessertList.value[indexPath.row]
//        cell.bind(trackViewModel: TrackViewModel(track: track))
        cell.bind(dessertlist: DessertViewModel(dessertViewmodel: dessertlist))
        return cell
    }
}
