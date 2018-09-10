//
//  AnimatedImageView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 10/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class AnimatedPieceView: UIView {
    
    var fractionComplete: CGFloat = 0.0 {
        didSet {
            self.animator?.fractionComplete = fractionComplete
        }
    }
    
    override var bounds: CGRect {
        didSet {
            if currentMask == nil && bounds != CGRect.zero {
                setupMaskView()
            }
        }
    }
    
    var animator: UIViewPropertyAnimator?
    
    var currentMask: UIView?
    
    var puzzleType: PuzzleType = .largeLeft
    
    lazy var submask1: UIView = {
        let mask = UIView(frame: self.currentMask!.bounds)
        mask.backgroundColor = .yellow
        return mask
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = .red
        print(self.bounds)
    }
    
    func setupMaskView() {
        self.currentMask = UIView(frame: CGRect(
            x: -self.bounds.width/2,
            y: 0,
            width: self.bounds.width * 2,
            height: self.bounds.height))
        
        self.currentMask?.backgroundColor = .clear
        
        self.currentMask?.addSubview(self.submask1)
        self.submask1.layer.anchorPoint = self.puzzleType.anchorPoint
        submask1.transform = self.puzzleType.transform
        
        self.mask = currentMask
        //self.clipsToBounds = false
        //self.addSubview(currentMask!)
        
        self.setupAnimator()
    }
    
    func setupAnimator() {
        self.animator = UIViewPropertyAnimator(duration: 2, curve: .linear, animations: {
            self.submask1.transform = self.puzzleType.endTransform
        })
    }
    
}
