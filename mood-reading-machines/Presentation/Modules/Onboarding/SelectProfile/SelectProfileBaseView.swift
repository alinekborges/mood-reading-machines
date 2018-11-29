//
//  SelectProfileBaseView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 28/11/18.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class SelectProfileBaseView: UIView {
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.select_profile_title()
        label.font = Constants.Fonts.thinLarge
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var loadingView: DefaultLoadingView = {
        return DefaultLoadingView()
    }()
    
    lazy var cloudView: CloudTagView = { view in
        view.tagBackgroundColor = UIColor.slate
        view.textColor = .white
        return view
    }(CloudTagView())
    
    lazy var anotherButton: UIButton = {
        let button = UIButton()
        button.setTitle(R.string.localizable.select_profile_button(), for: .normal)
        button.setTitleColor(UIColor.slate, for: .normal)
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
        self.addSubview(title)
        self.addSubview(cloudView)
        self.addSubview(anotherButton)
        
        self.title.prepareForConstraints()
        self.cloudView.prepareForConstraints()
        self.anotherButton.prepareForConstraints()
        
        self.title.pinSafeTop(30)
        self.title.pinLeft(30)
        self.title.pinRight(30)
        
        self.cloudView.pinLeft(30)
        self.cloudView.pinRight(30)
        self.cloudView.pinTopInRelationTo(self.title.bottomAnchor, constant: 40)
        self.cloudView.pinBottomInRelationTo(self.anotherButton.topAnchor, constant: 30)
        
        self.anotherButton.pinSafeBottom(40)
        self.anotherButton.pinLeft(30)
        self.anotherButton.pinRight(30)
        
    }
    
}
