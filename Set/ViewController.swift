//
//  ViewController.swift
//  Set
//
//  Created by David on 2018-08-02.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static var deck = Deck()
    
    var cardNumber: [Int:Bool] = [:]
    
    var endIndex = 12
    var newEndIndex: Int {
        get {
   
            return endIndex + 3}
    }
    var atributedTitle = NSAttributedString(string: "")
    
    @IBOutlet var cardsDisplayed: [UIButton]!
   
    @IBOutlet weak var addCards: UIButton!
    
    @IBAction func selectedCard(_ sender: UIButton) {
        selectCard(Sender: sender)
    }
    
    @IBAction func addingCards(_ sender: UIButton) {
      addingCards()
    }
    
    func selectCard (Sender: UIButton) {
        if let cardSelected = cardsDisplayed.index(of: Sender){
            let card = cardsDisplayed[cardSelected]
            
            if card.isSelected == true{
                card.layer.borderWidth = 0
                card.backgroundColor = #colorLiteral(red: 0.7764705882, green: 0.7764705882, blue: 0.7764705882, alpha: 1)}
            else if card.isSelected == false {
                
                card.layer.borderWidth = 3
                card.layer.borderColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)}
            
            card.isSelected = !card.isSelected
        }
    }
    
    func setCards(){
       
//        for index in cardsDisplayed.indices {
        for index in 0..<endIndex {
            let cardDeck = ViewController.deck.draw()
            let button: UIButton = cardsDisplayed[index]
            button.isHidden = false
            cardNumber[index] = true
            cardDisplay(cardDeck: cardDeck)
            buttonDisplay(button: button, atributedTitle: atributedTitle)
        }
        print("CardNumberIndex =\(cardNumber)")
    }
    func addMoreCards(){
        
        //        for index in cardsDisplayed.indices {
        for index in endIndex..<newEndIndex {
            let cardDeck = ViewController.deck.draw()
            let button: UIButton = cardsDisplayed[index]
            button.isHidden = false
            cardNumber[index] = true
            cardDisplay(cardDeck: cardDeck)
            buttonDisplay(button: button, atributedTitle: atributedTitle)
        }
         print("AddMoreCardsIndex =\(cardNumber)")
    }

    func addingCards() {
        if ViewController.deck.cards.count <= 4 {
            print("out of cards")
        }else{
            if cardNumber.count < 22{
                addMoreCards()
                endIndex += 3
                print(ViewController.deck.cards.count)
            }else if cardNumber.count > 22 {
                print("no space to put more cards")
                
                print(ViewController.deck.cards.count)
            }
        }
    }
    
    func cardDisplay(cardDeck: Card?)->NSAttributedString {
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
           
            
        atributedTitle = NSAttributedString(string: title, attributes: atributes)
        return atributedTitle
    }
    func buttonDisplay(button: UIButton, atributedTitle: NSAttributedString) {
        
            button.setAttributedTitle(atributedTitle, for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            button.layer.cornerRadius = 8.0
            button.isEnabled = true
        
        }
    
    
    
    func cardSelected() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCards()
        print(ViewController.deck.cards.count)
        
        
    }
}

