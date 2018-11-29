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
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        return activityIndicator
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
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
        self.addSubview(activityIndicator)
        self.addSubview(continueButton)
        
        self.titleLabel.prepareForConstraints()
        self.textField.prepareForConstraints()
        self.activityIndicator.prepareForConstraints()
        self.continueButton.prepareForConstraints()
        
        self.titleLabel.pinSafeTop(40.0)
        self.titleLabel.pinLeft(28.0)
        self.titleLabel.pinRight(28.0)
        
        self.textField.pinTopInRelationTo(titleLabel.bottomAnchor, constant: 20.0)
        self.textField.pinLeft(28.0)
        self.textField.pinRight(28.0)
        
        self.activityIndicator.centerVerticallyinRelationTo(self.textField.centerYAnchor)
        self.activityIndicator.pinRight(28.0)
        self.activityIndicator.stopAnimating()
        
        self.continueButton.centerHorizontally()
        self.continueButton.pinTopInRelationTo(self.textField.bottomAnchor, constant: 40.0)
        
    }
    
}
