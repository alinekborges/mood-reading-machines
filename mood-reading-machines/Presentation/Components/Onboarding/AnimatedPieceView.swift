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
    
    var puzzleType: PuzzleType = .largeLeftTop
    
    lazy var submasks: [PuzzleMask] = []
    
    init(type: PuzzleType) {
        super.init(frame: CGRect.zero)
        self.puzzleType = type
        self.setupViews()
    }
    
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
        
        self.submasks = getMaskViews(forType: self.puzzleType)
        
        submasks.forEach { view in
            self.currentMask?.addSubview(view)
        }
        
        self.mask = currentMask
        //self.clipsToBounds = false
        //self.addSubview(currentMask!)
        
        self.setupAnimator()
    }
    
    func getMaskViews(forType type: PuzzleType) -> [PuzzleMask] {
        
        guard let currentMask = self.currentMask else { return [] }
        
        let bounds = currentMask.bounds
        
        switch type {
        case .largeLeftTop:
            return [LeftTopMask(frame: bounds)]
        case .largeLeftBottom:
            return [LeftBottomMask(frame: bounds)]
        case .largeRightTop:
            return [RightTopMask(frame: bounds)]
        case .largeRightBottom:
            return [RightBottomMask(frame: bounds)]
        case .top:
            return [RightTopMask(frame: bounds), LeftTopMask(frame: bounds)]
        }
    }
    
    func setupAnimator() {
        self.animator = UIViewPropertyAnimator(duration: 2, curve: .linear, animations: {
            self.submasks.forEach {
                $0.transform = $0.endTransform
            }
        })
    }
    
}
