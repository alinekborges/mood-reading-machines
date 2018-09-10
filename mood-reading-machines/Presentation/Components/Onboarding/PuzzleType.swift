//
//  PuzzleType.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 10/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

enum PuzzleType {
    case largeLeft
}

extension PuzzleType {
    
    var anchorPoint: CGPoint {
        switch self {
        case .largeLeft:
            return CGPoint(x: 0.5, y: 1)
        }
    }
    
    private var rotationTransform: CGAffineTransform {
        switch self {
        case .largeLeft:
            return CGAffineTransform(rotationAngle: (-CGFloat.pi / 4) * 3)
        }
    }
    
    private var translationTransform: CGAffineTransform {
        switch self {
        case .largeLeft:
            return CGAffineTransform(translationX: 0, y: 20)
        }
    }
    
    var transform: CGAffineTransform {
        switch self {
        case .largeLeft:
            return self.rotationTransform.concatenating(self.translationTransform)
        }
    }
    
    var endTransform: CGAffineTransform {
        switch self {
        case .largeLeft:
            let rotation = CGAffineTransform(rotationAngle: -CGFloat.pi / 4)
            let translation = CGAffineTransform(translationX: 0, y: 20)
            return rotation.concatenating(transform)
        }
    }
    
}
