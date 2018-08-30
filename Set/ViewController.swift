//
//  ViewController.swift
//  Set
//
//  Created by David on 2018-08-02.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var deck = Deck()
    
    @IBOutlet var cardsDisplayed: [UIButton]!
    
    @IBAction func selectedCard(_ sender: UIButton) {
    
        if let cardSelected = cardsDisplayed.index(of: sender){
            let button = cardsDisplayed[cardSelected]
            
            if button.isSelected == true{
                button.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7764705882, alpha: 1)}
            else if button.isSelected == false {
                button.backgroundColor = #colorLiteral(red: 0.8806887658, green: 0.7427777225, blue: 0.9318884835, alpha: 1)}
            button.isSelected = !button.isSelected
        }
        
    }
    func updateCards() {
        for index in cardsDisplayed.indices {
            let cardDeck = deck.draw()
            let button: UIButton = cardsDisplayed[index]
            let title: String
            if cardDeck?.numberOfItems.rawValue == 1 {
                title = (cardDeck?.shape.rawValue)!
                
            } else if cardDeck?.numberOfItems.rawValue == 2 {
                title = "\((cardDeck?.shape.rawValue)!) \((cardDeck?.shape.rawValue)!)"
                }
            else {
                title = "\((cardDeck?.shape.rawValue)!) \((cardDeck?.shape.rawValue)!) \((cardDeck?.shape.rawValue)!)"
            }
            
            let atributes: [ NSAttributedStringKey : Any] = [NSAttributedStringKey.strokeColor : (cardDeck?.color.value)!,.strokeWidth : (cardDeck?.fill.value)! ,.foregroundColor : (cardDeck?.color.value)!.withAlphaComponent(CGFloat((cardDeck?.fill.rawValue)!))]
            button.layer.cornerRadius = 8.0
            
            let atributedTitle = NSAttributedString(string: title, attributes: atributes)
            button.setAttributedTitle(atributedTitle, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

        }
    }

    func cardSelected() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       updateCards()
        print(deck.cards.count)
        
        }
}

