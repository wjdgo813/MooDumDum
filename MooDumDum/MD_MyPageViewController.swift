//
//  MyPageViewController.swift
//  MooDumDum
//
//  Created by 김혜리 on 2018. 2. 2..
//  Copyright © 2018년 MooDumdum. All rights reserved.
//

import UIKit

class MD_MyPageViewController: UIViewController{

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var segmentContainer: UISegmentedControl!
    
    //    내가 쓴글, 내가 조문한 글
    @IBAction func ChangeContainer(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0)
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.firstView.alpha = 0.0
                self.secondView.alpha = 1.0
            })
        }
        else
        {
            UIView.animate(withDuration: 0.5, animations: {
                self.firstView.alpha = 1.0
                self.secondView.alpha = 0.0
            })
        }
    }
   
    //nickname 바꾸기
    @IBAction func EditNickName(_ sender: Any) {

        guard let nvc = self.storyboard?.instantiateViewController(withIdentifier: "NVC") as? MD_NickNameViewController else{
            return
        }
        
        nvc.nickname = self.nickName.text!

        self.navigationController?.pushViewController(nvc, animated: true)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myImage.layer.masksToBounds = false
        myImage.layer.cornerRadius = myImage.frame.height/2
        myImage.clipsToBounds = true
        
        segmentContainer.layer.cornerRadius = 0.0;
        segmentContainer.layer.borderWidth = 1;

        self.firstView.alpha = 0.0
        self.secondView.alpha = 1.0
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
