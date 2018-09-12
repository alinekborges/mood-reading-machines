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
            self.triangle1.fractionComplete = fractionComplete
        }
    }
    
    lazy var triangle1: AnimatedPieceView = {
        let triangle = AnimatedPieceView(type: PuzzleType.top)
        return triangle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.backgroundColor = .white
        
        setupConstraints()
    }
    
    func setupConstraints() {
        self.addSubview(triangle1)
        self.triangle1.prepareForConstraints()
        
        self.triangle1.pinEdgesToSuperview()
        
        //self.clipsToBounds = false
    }
    
}
