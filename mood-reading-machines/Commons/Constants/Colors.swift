//
//  Colors.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    @nonobjc class var slate: UIColor {
        return UIColor(red: 77, green: 96, blue: 112)
    }
    
    @nonobjc class var lightGrey: UIColor {
        return UIColor(red: 50, green: 50, blue: 50)
    }
    
    @nonobjc class var background: UIColor {
        return UIColor(red: 252, green: 252, blue: 252)
    }
    
    @nonobjc class var acqua: UIColor {
        return UIColor(red: 80, green: 227, blue: 194)
    }
    
    @nonobjc class var pastelYellow: UIColor {
        return #colorLiteral(red: 1, green: 0.9247377997, blue: 0.852739726, alpha: 1)
    }
    
    @nonobjc class var pastelBlue: UIColor {
        return #colorLiteral(red: 0.7696650257, green: 0.9229616523, blue: 0.8532775044, alpha: 1)
    }
    
    @nonobjc class var pastelGray: UIColor {
        return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(Double(red) / 255.0),
                  green: CGFloat(Double(green) / 255.0),
                  blue: CGFloat(Double(blue) / 255.0),
                  alpha: 1)
    }
    
}
