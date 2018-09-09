//
//  EnterUsernameBaseView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class EnterUsernameBaseView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.enter_username_title()
        label.font = Constants.Fonts.lightMedium
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var textField: TwitterTextField = {
        let textField = TwitterTextField()
        return textField
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
        self.addSubview(titleLabel)
        self.addSubview(textField)
        
        self.titleLabel.prepareForConstraints()
        self.textField.prepareForConstraints()
        
        self.titleLabel.pinSafeTop(40.0)
        self.titleLabel.pinLeft(28.0)
        self.titleLabel.pinRight(28.0)
        
        self.textField.pinfTopInRelationTo(titleLabel.bottomAnchor, constant: 20.0)
        self.textField.pinLeft(28.0)
        self.textField.pinRight(28.0)
        
    }
    
}
