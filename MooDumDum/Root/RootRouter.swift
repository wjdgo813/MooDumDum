//
//  RootRouter.swift
//  MooDumdum
//
//  Created by Haehyeon Jeong on 2018. 2. 10..
//  Copyright © 2018년 Haehyeon Jeong. All rights reserved.
//

import Foundation
import UIKit

class RootRouter{
    func presentArticlesScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MDHomeViewController")
        
        window.rootViewController = UINavigationController(rootViewController: vc)
        
    }
    
    @objc func loadMyinfo(){
        print("clicked!!")
    }
    
    @objc func loadCategoryList(){

        let sb = UIStoryboard(name: "MDCategoryListViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MDCategoryListViewController")
        
        
        let rightBarButtonItem = UIBarButtonItem(title: "my info", style: .plain, target: self, action: #selector(loadMyinfo))
        vc.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        UIApplication.shared.delegate?.window??.rootViewController?.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
