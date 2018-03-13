//
//  MDItemViewController.swift
//  MooDumDum
//
//  Created by Haehyeon Jeong on 2018. 2. 22..
//  Copyright © 2018년 MooDumdum. All rights reserved.
//

import UIKit
protocol Item{
    
}

enum ItemCellType{
    case categoryCell
}

extension ItemCellType{
    func reuseIdentifier()->String{
        switch self {
        case .categoryCell:
            return "MDCategoryCollectionViewCell"
        }
    }
}

protocol MDItemViewControllerDelegate:class {
    func itemViewController(_ itemViewController:MDItemViewController, cellNibForType type:ItemCellType)->UINib?
    func itemViewController(_ itemViewController:MDItemViewController, cellForItem indexPath:IndexPath)->UICollectionViewCell
    func itemViewController(_ itemViewController:MDItemViewController, didSelectItem item:Item,cellType:ItemCellType, atIndexPath indexPath:IndexPath)
    func itemViewController(_ itemViewController:MDItemViewController, numberOfItemsInSection section:Int)->Int
    func itemViewController(_ itemViewController:MDItemViewController, heightForRowAt indexPath:IndexPath)->CGSize
}

class MDItemViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
    weak var delegate : MDItemViewControllerDelegate!
    var viewModel : MDCategoryItemViewModel!
    var myCollectionView:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        collectionViewInit()
    }
    
    private func collectionViewInit(){
        assert(delegate != nil)
        assert(viewModel != nil)
        
        if let nib = delegate.itemViewController(self, cellNibForType: .categoryCell){
            self.myCollectionView?.register(nib, forCellWithReuseIdentifier: ItemCellType.categoryCell.reuseIdentifier())
        }
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = UICollectionViewScrollDirection.vertical
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets.zero
        self.myCollectionView?.collectionViewLayout = flowLayout
    }
    

    @objc func reload(){
        DispatchQueue.main.async {
            self.myCollectionView?.reloadData()
        }
    }    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate.itemViewController(self, numberOfItemsInSection: section)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return delegate.itemViewController(self, cellForItem: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return delegate.itemViewController(self, heightForRowAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate.itemViewController(self, didSelectItem: viewModel.item(atIndex: indexPath.row), cellType: viewModel.itemCellType(atIndex: indexPath.row), atIndexPath: indexPath)
    }
    
    
}
