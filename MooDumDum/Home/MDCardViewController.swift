//
//  MDCardViewController.swift
//  MooDumDum
//
//  Created by Haehyeon Jeong on 2018. 2. 12..
//  Copyright © 2018년 MooDumdum. All rights reserved.
//

import UIKit

class MDCardViewController: MDPullUpController {
    var draggableView : MDDraggableViewBackground!
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.willMoveToStickyPoint = { point in
            print("willMoveToStickyPoint \(point)")
            
        }
        
        self.didMoveToStickyPoint = { point in
            print("didMoveToStickyPoint \(point)")
            self.draggableView.allCardAddGesture()
        }
        
        
        var messageArr = Array<String>()
        messageArr = ["배가 고픈데 라면이 없어서 광광 우럭따", "second", "third", "fourth", "last"]
        
        self.draggableView = MDDraggableViewBackground(frame: self.view.frame)
//        draggableView.makeCards(messageArr);
        
        cardView.addSubview(draggableView)
    }

    override var pullUpControllerPreferredSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
    
    override var pullUpControllerPreviewOffset: CGFloat {
        return self.view.frame.height / 2
    }
    
    override var pullUpControllerIsBouncingEnabled: Bool {
        return false
    }
    
    override var pullUpControllerPreferredLandscapeFrame: CGRect {
        return CGRect(x: 5, y: 5, width: 280, height: UIScreen.main.bounds.height - 10)
    }

}
