//
//  DessertCell.swift
//  DessertProject
//
//  Created by Weerawat Plianchum on 28/10/2561 BE.
//  Copyright © 2561 Weerawat Plianchum. All rights reserved.
//

import UIKit
import Spring
import RxSwift
import RxCocoa


class DessertCell: UITableViewCell{
    
    
    @IBOutlet weak var dessertimg: UIImageView!
    
    private var disposeBag: DisposeBag? = DisposeBag()
    
    var viewModel: DessertCellModeling? {
        didSet {
            let disposeBag = DisposeBag()
            
            guard let viewModel = viewModel else { return }
            
            viewModel.image
                .bind(to: dessertimg.rx.image)
                .disposed(by: disposeBag)
            
    
            
            self.disposeBag = disposeBag
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        viewModel = nil
        disposeBag = nil
    }
    override func awakeFromNib() {
       super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
