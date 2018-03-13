//
//  MD_CollectionViewCell.swift
//  MooDumDum
//
//  Created by 김혜리 on 2018. 2. 8..
//  Copyright © 2018년 MooDumdum. All rights reserved.
//

import UIKit

class MD_CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    func displayContent(images: UIImage, title: String){
        label.text = title
        image.image = images
 
    }
    
}
