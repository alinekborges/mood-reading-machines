//
//  PuzzleMasking.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 10/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class PuzzleMask: UIView {
    
    let startRotationAngle: CGFloat = 0.0
    let endRotationAngle: CGFloat = 0.0
    let padding: CGFloat
    
    var endTransform: CGAffineTransform {
        return endRotationTransform.concatenating(endTranslationTransform)
    }
    
    private let rotationTransform: CGAffineTransform
    private let translationTransform: CGAffineTransform
    private let startTransform: CGAffineTransform
    
    private let endRotationTransform: CGAffineTransform
    private let endTranslationTransform: CGAffineTransform
    
    init(frame: CGRect, startRotationAngle: CGFloat, endRotationAngle: CGFloat, padding: CGFloat = 6.0) {
        self.padding = padding
        
        self.rotationTransform = CGAffineTransform(rotationAngle: startRotationAngle)
        self.translationTransform = CGAffineTransform(translationX: 0, y: padding)
        self.startTransform = rotationTransform.concatenating(translationTransform)
        
        self.endRotationTransform = CGAffineTransform(rotationAngle: endRotationAngle)
        self.endTranslationTransform = CGAffineTransform(translationX: 0, y: padding)
        
        super.init(frame: frame)
        
        self.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        self.transform = startTransform
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

