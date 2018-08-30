//
//  Deck.swift
//  Set
//
//  Created by David on 2018-08-02.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

struct Deck{
  
    var cards = [Card]()
    
    init () {
        for shapes in Card.shapeChoice.all{
            for numbers in Card.numberChoice.all {
                for fill in Card.fillChoice.all {
                    for color in colorChoice.all {
                        cards.append(Card(color: color, shape: shapes, fill: fill, numberOfItems: numbers))
                    }
                }
            }
        }
    }
    mutating func draw() -> Card? {
        if cards.count > 0 {
          return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
}
}
