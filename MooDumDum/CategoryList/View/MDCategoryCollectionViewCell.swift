//
//  MDCategoryCollectionViewCell.swift
//  MooDumDum
//
//  Created by Haehyeon Jeong on 2018. 2. 22..
//  Copyright © 2018년 MooDumdum. All rights reserved.
//

import UIKit

class MDCategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleImageView: UIImageView!
    
    var onTouchedUser: (()->Void)?
    var viewModel : MDCategoryCellViewModel? {
        didSet{
            display()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func display(){
        do {
            try backgroundImageView.image = UIImage(data: Data(contentsOf: (viewModel?.background_url)!))
            try titleImageView.image = UIImage(data: Data(contentsOf: (viewModel?.image_url)!))
        } catch  {
        }
    }
}
