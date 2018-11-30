//
//  TweetCellView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 09/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class TweetCellBaseView: UIView {
    
    lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.background
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cell"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .slate
        return label
    }()
    
    var cardView: MaterialCardView = MaterialCardView()
    
    init() {
        super.init(frame: CGRect.zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    func setupViews() {
        self.backgroundColor = .white
        
        self.addSubview(container)
        container.addSubview(cardView)
        cardView.addSubview(titleLabel)
        
        self.container.prepareForConstraints()
        self.titleLabel.prepareForConstraints()
        self.cardView.prepareForConstraints()
        
        container.pinEdgesToSuperview()
        
        self.titleLabel.pinEdgesToSuperview(16)
        
        self.cardView.pinLeft(22)
        self.cardView.pinRight(22)
        self.cardView.pinTop(16)
        self.cardView.pinBottom()
        
    }
    
}
