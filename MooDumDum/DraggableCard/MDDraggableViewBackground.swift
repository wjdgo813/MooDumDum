//
//  DraggableViewBackground.swift
//  SwiftTinderCards
//
//  Created by Lukasz Gandecki on 3/23/15.
//  Copyright (c) 2015 Lukasz Gandecki. All rights reserved.
//

import Foundation
import UIKit


class MDDraggableViewBackground: UIView, DraggableViewDelegate {
    
    func cardSwiped(_ card: UIView!) {
        processCardSwipe()
    }
    
    
    let MAX_BUFFER_SIZE = 2;
    let CARD_HEIGHT = CGFloat(386.0);
    let CARD_WIDTH = CGFloat(290.0);
    
    let menuButton = UIButton()
    let messageButton = UIButton()
    let checkButton = UIButton()
    let xButton = UIButton()
    
    let exampleCardLabels = ["first", "second", "third", "fourth", "last"]
    var loadedCards = NSMutableArray()
    var allCards =  NSMutableArray()
    var cardsLoadedIndex = 0
    var numLoadedCardsCap = 0
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layoutSubviews()
        setupView()
        setLoadedCardsCap()
        createCards()
        displayCards()
    }
    
    func setupView() {
        setBackgroundColor()

    }
    
    func setBackgroundColor() {
        self.backgroundColor = UIColor(red: 0.92, green: 0.93, blue: 0.95, alpha: 1);
    }
    

    
    func setLoadedCardsCap() {
        numLoadedCardsCap = 0;
        if (exampleCardLabels.count > MAX_BUFFER_SIZE) {
            numLoadedCardsCap = MAX_BUFFER_SIZE
        } else {
            numLoadedCardsCap = exampleCardLabels.count
        }
        
    }
    
    func createCards() {
        if (numLoadedCardsCap > 0) {
            let cardFrame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
            for cardLabel in exampleCardLabels {
                let newCard = DraggableView(frame: cardFrame)
                newCard.information.text = cardLabel
                newCard.delegate = self;
                allCards.add(newCard)
            }
        }
    }
    
    func moreCreateCards(){
        if (numLoadedCardsCap > 0) {
            let cardFrame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
            for cardLabel in exampleCardLabels {
                let newCard = DraggableView(frame: cardFrame)
                newCard.information.text = cardLabel
                newCard.delegate = self;
                newCard.panGestureAdd()
                allCards.add(newCard)
            }
        }
    }
    
    func displayCards() {
        for i in 0..<numLoadedCardsCap {
            loadACardAt(index: i)
        }
        
    }
    
    func cardSwipedLeft(card: DraggableView) {
        processCardSwipe()
    }
    
    func cardSwipedRight(card: DraggableView) {
        processCardSwipe()
    }


    func allCardAddGesture(){
        for cardView in allCards{
            (cardView as! DraggableView).panGestureAdd()
        }
    }
    
    
    func processCardSwipe() {
        loadedCards.removeObject(at: 0)
        
        if loadedCards.count <= 2 {
            moreCreateCards()
        }
        
        if (moreCardsToLoad()) {
            loadNextCard()
        }
        
    }
    
    func moreCardsToLoad() -> Bool {
        return cardsLoadedIndex < allCards.count;
    }
    
    func loadNextCard() {
        loadACardAt(index: cardsLoadedIndex)
    }
    
    func loadACardAt(index: Int) {
        loadedCards.add(allCards[index])
        if (loadedCards.count > 1) {
            insertSubview(loadedCards[loadedCards.count-1] as! DraggableView, belowSubview: loadedCards[loadedCards.count-2] as! DraggableView)
            // is there a way to define the array with UIView elements so I don't have to cast?
        } else {
            addSubview(loadedCards[0] as! DraggableView)
        }
        cardsLoadedIndex = cardsLoadedIndex + 1;
    }
    
    func swipeRight() {
        let dragView = loadedCards[0] as! DraggableView
        print ("Clicked right", terminator: "")
        dragView.rightClickAction()
    }
    
    func swipeLeft() {
        let dragView = loadedCards[0] as! DraggableView
        print ("clicked left", terminator: "")
        dragView.leftClickAction()
    }
}

