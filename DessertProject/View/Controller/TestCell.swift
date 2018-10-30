//
//  TestCell.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell{
    
    @IBOutlet weak var tittleLabel: UILabel!
    
    @IBOutlet weak var imageTitlte: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
