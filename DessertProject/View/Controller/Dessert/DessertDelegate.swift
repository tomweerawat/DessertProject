//
//  DessertDelegate.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 3/11/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import UIKit

extension DessertViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        self.scrollOffset.value = scrollView.contentOffset.y
//    }
    
}
