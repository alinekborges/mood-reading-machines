//
//  PuzzleOnboardingView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 10/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class PuzzleOnboardingView: UIView {
    
    var fractionComplete: CGFloat = 0.0 {
        didSet {
            setAnimatorsPercentage(fractionComplete)
        }
    }
    
    private lazy var pieces: [AnimatedPieceView] = {
        let piece1 = AnimatedPieceView(type: PuzzleType.largeLeftBottom)
        let piece2 = AnimatedPieceView(type: PuzzleType.largeRightTop)
        return [piece1, piece2]
    }()
    
    private lazy var imageViews: [UIImageView] = {
        let imageView1 = UIImageView()
        imageView1.backgroundColor = .red
        imageView1.contentMode = .scaleAspectFill
        let imageView2 = UIImageView()
        imageView2.backgroundColor = .blue
        imageView1.contentMode = .scaleAspectFill
        return [imageView2, imageView1]
    }()
    
    private var leftConstraints: [NSLayoutConstraint] = []
    
    var dismissAnimators: [UIViewPropertyAnimator] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = .clear
        
        setupConstraints()
        setupAnimators()
        
        self.isUserInteractionEnabled = false
    }
    
    func setupConstraints() {
        
        zip(self.pieces, self.imageViews).forEach { piece, imageView in
            
            self.addSubview(piece)
            piece.addSubview(imageView)
            
            piece.prepareForConstraints()
            imageView.prepareForConstraints()
            
            piece.pinTop()
            piece.pinBottom()
            piece.widthAnchor.constraint(equalTo: piece.heightAnchor, multiplier: 1).isActive = true
            
            imageView.pinEdgesToSuperview()
            
            if let leftConstraint = piece.pinLeft() {
                self.leftConstraints.append(leftConstraint)
            }
            self.layoutIfNeeded()
        }
   
    }
    
    func setupAnimators() {
        let animator1 = UIViewPropertyAnimator(duration: 2,
                                               curve: .easeIn) {
            self.leftConstraints.first?.constant -= 600
            self.pieces.first?.alpha = 0
            self.layoutIfNeeded()
        }
        
        let animator2 = UIViewPropertyAnimator(duration: 2,
                                              curve: .easeOut) {
            self.leftConstraints.last?.constant -= 600
            
            self.layoutIfNeeded()
        }
        
        let animator3 = UIViewPropertyAnimator(duration: 2,
                                               controlPoint1: CGPoint(x: 0.2, y: 0.8),
                                               controlPoint2: CGPoint(x: 0.2, y: 0.8)) {
            self.pieces.last?.alpha = 0
            self.pieces.first?.alpha = 0
        }
        
        self.dismissAnimators.append(animator1)
        self.dismissAnimators.append(animator2)
        self.dismissAnimators.append(animator3)
        
        self.dismissAnimators.forEach {
            $0.pausesOnCompletion = false
            $0.scrubsLinearly = false
        }
    }
    
    func setAnimatorsPercentage(_ fractionComplete: CGFloat) {
        if fractionComplete < 0.5 {
            self.dismissAnimators.forEach { $0.fractionComplete = 0 }
            self.pieces.forEach { $0.fractionComplete = fractionComplete * 2 }
        } else {
            self.pieces.forEach { $0.fractionComplete = 1 }
            self.dismissAnimators.forEach { $0.fractionComplete = (fractionComplete - 0.5) * 2 }
        }
        
    }
    
}
