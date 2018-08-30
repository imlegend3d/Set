//
//  Card.swift
//  Set
//
//  Created by David on 2018-08-02.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

struct Card: CustomStringConvertible, Equatable {
    var description: String  {return "\(numberOfItems) \(shape) \(color) \(fill)"}
    
    var color: colorChoice
    var shape: shapeChoice
    var fill: fillChoice
    var numberOfItems: numberChoice
    
    enum shapeChoice: String, CustomStringConvertible {
    
        
        case circle = "●"
        
        case square = "◼︎"
        
        case diamond = "◆"
        
        static var all = [shapeChoice.circle, .square, .diamond ]
        
       var description: String {return rawValue}
    }
    
    enum numberChoice: Int {
        typealias RawValue = Int
        
        case one = 1
        
        case two
        
        case three
        
        static var all = [numberChoice.one, .two, .three]
    }
    
    enum fillChoice: Double {
        case solid = 1

        case shaded = 0.35

        case blank = 0.0

    static var all = [fillChoice.solid, .shaded, .blank]
    }
}
    enum colorChoice{
        
        case setYellow

        case setBlue

        case setRed

    static var all = [colorChoice.setYellow, .setBlue, .setRed]
    }

extension colorChoice {
    var value: UIColor {
        get {
            switch self {
            case .setYellow:
                return #colorLiteral(red: 0.9724636084, green: 1, blue: 0.5484327653, alpha: 1)
            case .setBlue:
                return #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            case .setRed:
                return #colorLiteral(red: 1, green: 0.105402366, blue: 0.1032447025, alpha: 1)
            }
        }
    }
}
extension Card.fillChoice {
    var value: Int {
        get {
            switch self {
            case .solid:
                return -5
            case .shaded:
                return 0
            case .blank:
                return 5
            }
        }
    }
}
extension UIColor {
    struct SetColors {
        static var setYellow: UIColor { return UIColor(cgColor: #colorLiteral(red: 0.9724636084, green: 1, blue: 0.5484327653, alpha: 1))}
        static var setBlue: UIColor {return UIColor(cgColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))}
        static var setRed: UIColor { return UIColor(cgColor: #colorLiteral(red: 1, green: 0.105402366, blue: 0.1032447025, alpha: 1))}
    }
}

extension CGColor {
    struct SetColors {
        static var setYellow: CGColor { return UIColor(cgColor: #colorLiteral(red: 0.9724636084, green: 1, blue: 0.5484327653, alpha: 1)) as! CGColor}
        static var setBlue: CGColor {return UIColor(cgColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)) as! CGColor}
        static var setRed: CGColor { return UIColor(cgColor: #colorLiteral(red: 1, green: 0.105402366, blue: 0.1032447025, alpha: 1)) as! CGColor}
    }
}
