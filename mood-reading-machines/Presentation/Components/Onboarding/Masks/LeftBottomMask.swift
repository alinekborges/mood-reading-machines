//
//  LeftBottomMask.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 10/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class LeftBottomMask: PuzzleMask {
    
    init(frame: CGRect, padding: CGFloat = 6.0) {
        let startRotationAngle = (-CGFloat.pi / 4) * 3
        let endRotationAngle = -CGFloat.pi
        
        super.init(frame: frame,
                   startRotationAngle: startRotationAngle,
                   endRotationAngle: endRotationAngle,
                   padding: padding)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
