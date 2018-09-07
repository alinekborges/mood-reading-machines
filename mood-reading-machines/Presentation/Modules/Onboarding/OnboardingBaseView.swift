//
//  OnboardingBaseView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class OnboardingBaseView: UIView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "OnboardingView"
        return label
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    func setupSubviews() {
        self.backgroundColor = .white
        self.addSubview(label)
        
        self.label.prepareForConstraints()
        
        self.label.centerVertically()
        self.label.centerHorizontally()
    }
    
}
