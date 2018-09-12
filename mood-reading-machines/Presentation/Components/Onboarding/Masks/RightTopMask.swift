//
//  RightTopMask.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 10/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class RightTopMask: PuzzleMask {
    
    init(frame: CGRect, padding: CGFloat = 6.0) {
        let startRotationAngle = (CGFloat.pi / 4)
        let endRotationAngle: CGFloat = 0.0
        
        super.init(frame: frame,
                   startRotationAngle: startRotationAngle,
                   endRotationAngle: endRotationAngle,
                   padding: -padding)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
