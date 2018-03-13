//
//  MD_SecondViewController.swift
//  MooDumDum
//
//  Created by 김혜리 on 2018. 2. 10..
//  Copyright © 2018년 MooDumdum. All rights reserved.
//

import UIKit

class MD_SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    func collectionView(_ collecxrtionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MD_CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MD_CollectionViewCell
//        cell.image.image = UIImage(named:"image2.jpg")
//        cell.label.text = "슬프다"
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.dataSource = self
        CollectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
