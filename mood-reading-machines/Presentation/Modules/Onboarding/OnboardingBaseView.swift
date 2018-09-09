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
    
    let enterUsernameView: EnterUsernameView
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "OnboardingView"
        return label
    }()
    
    init(enterUsernameView: EnterUsernameView) {
        self.enterUsernameView = enterUsernameView
        super.init(frame: CGRect.zero)
        self.setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    func setupSubviews() {
        self.backgroundColor = .white
        
        self.addSubview(label)
        self.addSubview(enterUsernameView.view)
        
        self.label.prepareForConstraints()
        self.enterUsernameView.view.prepareForConstraints()
        
        self.enterUsernameView.view.pinEdgesToSuperview()
        
        self.label.centerVertically()
        self.label.centerHorizontally()
    }
    
}
