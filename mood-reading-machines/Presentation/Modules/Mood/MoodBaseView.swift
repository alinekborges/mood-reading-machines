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
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "MoodView"
        return label
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
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
        self.addSubview(container)
        
        self.label.prepareForConstraints()
        
        self.label.centerVertically()
        self.label.centerHorizontally()
    }
    
}
