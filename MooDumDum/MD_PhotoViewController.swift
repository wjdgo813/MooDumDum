//
//  MD_PhotoViewController.swift
//  MooDumDum
//
//  Created by 김혜리 on 2018. 2. 19..
//  Copyright © 2018년 MooDumdum. All rights reserved.
//

import UIKit

class MD_PhotoViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var sendText: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var myPhoto: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var textview : String = ""

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: MD_CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MD_CollectionViewCell

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        self.textView.text = textview
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //collectionView cell 선택될시 uiimageView에 띄우기
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        

    }
}
