//
//  DessertCell.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import UIKit
import RxSwift
import SDWebImage


class DessertCell: UITableViewCell{
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    public static let reuseIdentifier = "DessertCell"
    
    public var dessertViewModel: DessertViewModel!
    private let disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func bind(dessertlist: DessertViewModel) {
        dessertViewModel = dessertlist
        
        dessertViewModel.dessertViewmodel.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (list) in
               self.thumbImage.sd_setImage(with: URL(string: list?.collection?.image_url ?? ""), completed: nil)
                self.nameLabel.text = list?.collection?.title
                self.locationName.text = list?.collection?.description
            }).disposed(by: disposeBag)
    }
}
