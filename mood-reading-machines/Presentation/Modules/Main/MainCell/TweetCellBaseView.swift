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
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cell"
        label.numberOfLines = 0
        return label
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }
    
    func setupViews() {
        self.backgroundColor = .white
        
        self.addSubview(titleLabel)
        
        self.titleLabel.prepareForConstraints()
        
        self.titleLabel.pinEdgesToSuperview()
    }
    
}
