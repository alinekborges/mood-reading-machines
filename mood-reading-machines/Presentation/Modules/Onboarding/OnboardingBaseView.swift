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
    
    let selectProfileView: SelectProfileView
    
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
        view.backgroundColor = .white
        return view
    }()
    
    lazy var page2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var puzzleOnboardingView: PuzzleOnboardingView = {
        let view = PuzzleOnboardingView()
        return view
    }()
    
    lazy var title1: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.onboarding_page1_title()
        label.font = Constants.Fonts.thinLarge
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var title2: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.onboarding_page2_title()
        label.font = Constants.Fonts.thinLarge
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    init(selectProfileView: SelectProfileView) {
        self.selectProfileView = selectProfileView
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
        self.setupPuzzleView()
        self.setupLabels()
    }
    
    func setupPages() {
        
        self.contentView.addSubview(page1)
        self.contentView.addSubview(page2)
        self.contentView.addSubview(selectProfileView.view)
        
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
        
        selectProfileView.view.prepareForConstraints()
        selectProfileView.view.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        selectProfileView.view.pinTop()
        selectProfileView.view.pinBottom()
        selectProfileView.view.pinfLeftInRelationTo(page2.rightAnchor)
        
    }
    
    func setupPuzzleView() {
        
        self.addSubview(puzzleOnboardingView)
        
        self.puzzleOnboardingView.prepareForConstraints()
        
        puzzleOnboardingView.pinLeft(30.0)
        puzzleOnboardingView.pinRight(30.0)
        puzzleOnboardingView.pinTop(100.0)
        
        puzzleOnboardingView.widthAnchor.constraint(equalTo: puzzleOnboardingView.heightAnchor).isActive = true
    }
    
    func setupLabels() {
        page1.addSubview(title1)
        title1.prepareForConstraints()
        
        page2.addSubview(title2)
        title2.prepareForConstraints()
        
        title1.pinLeft(40.0)
        title1.pinRight(40.0)
        title1.pinSafeBottom(40.0)
        title1.pinTopInRelationTo(self.puzzleOnboardingView.bottomAnchor)
        
        title2.pinLeft(40.0)
        title2.pinRight(40.0)
        title2.pinSafeBottom(40.0)
        title2.pinTopInRelationTo(self.puzzleOnboardingView.bottomAnchor)
    }
    
}
