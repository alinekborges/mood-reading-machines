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
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var page1: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    lazy var page2: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
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
        
        self.addSubview(scrollView)
        self.scrollView.addSubview(contentView)
        
        self.scrollView.prepareForConstraints()
        self.contentView.prepareForConstraints()
        
        self.scrollView.pinEdgesToSuperview()
        self.scrollView.isPagingEnabled = true
        self.scrollView.bounces = false
        
        self.contentView.pinEdgesToSuperview()
        self.contentView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 3).isActive = true
        self.contentView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        self.setupPages()
    }
    
    func setupPages() {
        
        self.contentView.addSubview(page1)
        self.contentView.addSubview(page2)
        self.contentView.addSubview(self.enterUsernameView.view)
        
        page1.prepareForConstraints()
        page1.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        page1.pinTop()
        page1.pinBottom()
        page1.pinLeft()
        
        page2.prepareForConstraints()
        page2.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        page2.pinTop()
        page2.pinBottom()
        page2.pinfLeftInRelationTo(page1.rightAnchor)
        
        enterUsernameView.view.prepareForConstraints()
        enterUsernameView.view.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        enterUsernameView.view.pinTop()
        enterUsernameView.view.pinBottom()
        enterUsernameView.view.pinfLeftInRelationTo(page2.rightAnchor)
        
    }
    
}
