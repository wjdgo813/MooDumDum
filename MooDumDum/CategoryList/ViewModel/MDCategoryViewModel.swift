//
//  MDCategoryViewModel.swift
//  MooDumDum
//
//  Created by Haehyeon Jeong on 2018. 2. 22..
//  Copyright © 2018년 MooDumdum. All rights reserved.
//

import Foundation



class MDCategoryViewModel:MDCategoryItemViewModel{

    let model              : MDCategoryModel?
    var numberOfItems: Int {
        if let count = self.model?.categoryData?.count{
            return count
        }
        return 0
    }
    
    init() {
        self.model = MDCategoryModel()
        NotificationCenter.default.addObserver(self, selector: #selector(onChangedIssues(noti:)), name: Notification.Name.CategoryModel.changedLists, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
   
    func itemCellViewModel(atIndex index: Int) -> MDCategoryItemCellViewModel? {
        let categoryData = self.item(atIndex: index)
        return MDCategoryCellViewModel(data: categoryData as! MDCategoryData)
    }

    func item(atIndex index: Int) -> Item {
        return (self.model?.categoryData.categoryList[index])!
    }
    
    func itemCellType(atIndex index: Int) -> ItemCellType {
        return .categoryCell
    }
    
    func loadCategory() {
        model?.loadCategory()
    }
    
    @objc func onChangedIssues(noti:Notification) {
        NotificationCenter.default.post(name: Notification.Name.CategoryViewModel.changedLists, object: nil)
    }
    
}
