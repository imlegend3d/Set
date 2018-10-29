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
    
    var startingDeck: [Card] = []
    
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
    var cardsSelectedArray: [Card] = []
    
    // algorithm to check if cards matched accoring to set rules.
    // if match to removed the cards from the array and UI (using dictionary) to keep the spaces empty.
    // being able to add more 3 more cards in the empty spaces.
    // reorganize and move into setgame.
    // add security to entire game source code.
    
    func selectCard (Sender: UIButton)->[Card] {
        
        if let cardSelected = cardsDisplayed.index(of: Sender){
            let card = cardsDisplayed[cardSelected]
            
      // make it so that the card can only be added one time, UIButton and Card selections.
            
            //Game selection and deselection of cards, (can be factor into a function and moved to Gameset Controller).
            
            if cardsSelectedArray.contains(startingDeck[cardsDisplayed.index(of: Sender)!]) {
                cardsSelectedArray.remove(at: cardsSelectedArray.lastIndex(of: startingDeck[cardsDisplayed.index(of: Sender)!])!)
            }
            // make it so that there is a maximun of only 3 cards allowed for selection.
            else if cardsSelectedArray.count >= 3 {
            // need to make so that if a 4th card is added to removed the prevoiuly selected from the array and at the same time to deselect the ccards from the UI and to add the new one and show the selection of the new one.
                cardsSelectedArray.removeAll()
                    for i in 0..<endIndex {
                        cardsDisplayed[i].isSelected = false
                        cardsDisplayed[i].layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                        cardsDisplayed[i].layer.borderWidth = 0}
                cardsSelectedArray.append(startingDeck[cardsDisplayed.index(of: Sender)!])
            } else {
                //add cards to cardsSelectedArray
                cardsSelectedArray.append(startingDeck[cardsDisplayed.index(of: Sender)!])
                
            }
            //UI Selection of buttons, (can be factor into a function, for later).
            card.isSelected = !card.isSelected
            if card.isSelected == true{
                
                card.layer.borderWidth = 3
                card.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)}
            else if card.isSelected == false {
               
                card.layer.borderWidth = 0
                card.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)}
        }
        print("Cards Added to Array by selecting the card\(cardsSelectedArray)")
       return cardsSelectedArray
    }
    
   
    
    func getCardsArray(){
        
        for _ in 1...ViewController.deck.cards.count {
            startingDeck.append(ViewController.deck.draw()!)
        }
        
        print("Starting deck: \(startingDeck.count)")
        
    }
    
    
    
    func setGame(arrayCards: [Card])->Bool{
        
        
        return false
    }
    
    func setCards(){
        for index in 0..<endIndex {
            let card = startingDeck[index]
            let button: UIButton = cardsDisplayed[index]
            button.isHidden = false
            cardNumber[index] = true
            cardDisplay(card: card)
            buttonDisplay(button: button, atributedTitle: atributedTitle)
        }
        print("CardNumberIndex =\(cardNumber)")
    }

    func addMoreCards(){
        for index in endIndex..<newEndIndex {
            let card = startingDeck[index]
            let button: UIButton = cardsDisplayed[index]
            button.isEnabled = true 
            button.isHidden = false
            cardNumber[index] = true
            cardDisplay(card: card)
            buttonDisplay(button: button, atributedTitle: atributedTitle)
        }
         print("AddMoreCardsIndex =\(cardNumber)")
    }

    func addingCards() {
        if startingDeck.count <= 4 {
            print("out of cards")
        }else{
            if cardNumber.count < 22{
                addMoreCards()
                print(ViewController.deck.cards.count)
                endIndex += 3
            }else if cardNumber.count > 22 {
                print("no space to put more cards")
                print("Origin deck: \(ViewController.deck.cards.count)")
                print("Starting deck \(startingDeck.count)")
            }
        }
    }
    
    func cardDisplay(card: Card?)->NSAttributedString {
        let title: String
            if card?.numberOfItems.rawValue == 1 {
                title = (card?.shape.rawValue)!
                
            } else if card?.numberOfItems.rawValue == 2 {
                title = "\((card?.shape.rawValue)!) \((card?.shape.rawValue)!)"
                }
            else {
                title = "\((card?.shape.rawValue)!) \((card?.shape.rawValue)!) \((card?.shape.rawValue)!)"
            }
            
            let atributes: [ NSAttributedString.Key : Any] = [NSAttributedString.Key.strokeColor : (card?.color.value)!,.strokeWidth : (card?.fill.value)! ,.foregroundColor : (card?.color.value)!.withAlphaComponent(CGFloat((card?.fill.rawValue)!))]
        
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
        getCardsArray()
        setCards()
        print(ViewController.deck.cards.count)
        
    }
}

