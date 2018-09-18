//
//  TwitterTextField.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 09/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class TwitterTextField: UIView {
    
    private lazy var labelMention: UILabel = {
        let label = UILabel()
        label.font = Constants.Fonts.lightMedium
        label.textColor = .lightGrey
        label.text = "@"
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300.0, height: 40.0)
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 300.0, height: 40.0))
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    override func becomeFirstResponder() -> Bool {
        return self.textField.becomeFirstResponder()
    }
    
    private func setupViews() {
        
        self.addSubview(labelMention)
        self.addSubview(textField)
        
        self.labelMention.prepareForConstraints()
        self.textField.prepareForConstraints()
        
        self.labelMention.pinLeft()
        self.labelMention.centerVertically()
        self.labelMention.setContentHuggingPriority(UILayoutPriority(rawValue: 500), for: .horizontal)
        
        self.textField.pinfLeftInRelationTo(self.labelMention.rightAnchor, constant: 10.0)
        self.textField.pinRight()
        self.textField.pinTop()
        self.textField.pinBottom()
        
    }
    
}

extension Reactive where Base: TwitterTextField {
    
    var text: ControlProperty<String?> {
        return base.textField.rx.text
    }
    
}
