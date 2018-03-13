//
//  NickNameViewController.swift
//  MooDumDum
//
//  Created by 김혜리 on 2018. 2. 10..
//  Copyright © 2018년 MooDumdum. All rights reserved.
//

import UIKit

class MD_NickNameViewController: UIViewController{
 
    @IBOutlet weak var NickTextField: UITextField!
    
    var nickname : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.NickTextField.text = nickname

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }
    
    //chagne nickname
    @IBAction func changeNick(_ sender: Any) {
        print(NickTextField.text!)
        
        let preVC = self.presentingViewController
        guard let vc = preVC as? MD_MyPageViewController else {
            print(1)
            return
            
        }
        
        vc.nickName.text = self.NickTextField.text
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    


}
