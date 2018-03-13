//
//  WriteViewController.swift
//  MooDumDum
//
//  Created by 김혜리 on 2018. 2. 3..
//  Copyright © 2018년 MooDumdum. All rights reserved.
//

import UIKit

class MD_WriteViewController: UIViewController {
    

    @IBOutlet weak var WriteText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WriteText.becomeFirstResponder()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //다음 버튼 눌렀을 경우 사진 선택
    @IBAction func WriteSave(_ sender: Any) {
        
        guard let pto = self.storyboard?.instantiateViewController(withIdentifier: "PTO") as? MD_PhotoViewController else {
            return
        }
        
        pto.textview = self.WriteText.text!
        self.navigationController?.pushViewController(pto, animated: true)
        
    }
    
  

}
