//
//  MDCategoryNoficationExtension.swift
//  MooDumDum
//
//  Created by Haehyeon Jeong on 2018. 2. 22..
//  Copyright © 2018년 MooDumdum. All rights reserved.
//

import Foundation
extension Notification.Name{
    struct CategoryModel{
        static let changedLists:Notification.Name = Notification.Name("categoryModel")
    }
    
    struct CategoryViewModel {
        static let changedLists:Notification.Name = Notification.Name("categoryViewModel")
    }
}
