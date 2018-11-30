//
//  MoodBaseView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 29/11/18.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class MoodBaseView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cell"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.light)
        label.textColor = .slate
        return label
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var cardView: MaterialCardView = {
        let view = MaterialCardView()
        return view
    }()
    
    lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        return view
    }()
    
    lazy var feelingLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.thinMedium
        label.textColor = .slate
        label.textAlignment = .center
        label.alpha = 0.0
        label.numberOfLines = 0
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
        self.addSubview(blurView)
        self.addSubview(container)
        self.cardView.addSubview(titleLabel)
        self.cardView.addSubview(feelingLabel)
        
        self.container.addSubview(cardView)
        
        self.titleLabel.prepareForConstraints()
        self.cardView.prepareForConstraints()
        self.blurView.prepareForConstraints()
        self.feelingLabel.prepareForConstraints()
        
        self.titleLabel.pinEdgesToSuperview(16)
        
        self.cardView.pinLeft(22)
        self.cardView.pinRight(22)
        self.cardView.pinTop(16)
        self.cardView.pinBottom()
        
        self.blurView.pinEdgesToSuperview()
        
        self.feelingLabel.pinLeft()
        self.feelingLabel.pinRight()
        self.feelingLabel.pinBottom(22)
        
    }
    
}
