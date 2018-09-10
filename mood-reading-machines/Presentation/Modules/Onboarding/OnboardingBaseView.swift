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
        view.backgroundColor = .white
        return view
    }()
    
    lazy var page2: UIView = {
        let view = UIView()
        //view.backgroundColor = .white
        view.backgroundColor = UIColor.black.withAlphaComponent(0.03)
        return view
    }()
    
    lazy var puzzleOnboardingView: PuzzleOnboardingView = {
        let view = PuzzleOnboardingView()
        return view
    }()
    
    lazy var viewImage1: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.clipsToBounds = true
        return view
    }()
    
    lazy var viewImage2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
        view.clipsToBounds = true
        return view
    }()
    
    lazy var viewImage2Mask: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        //view.backgroundColor = .white
        return view
    }()

    lazy var viewImage1Mask: UIView = {
        let view = UIView()
        //view.backgroundColor = UIColor.red.withAlphaComponent(0.3)
        view.backgroundColor = .white
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
        self.setupPuzzleView()
        //self.setupImage1()
        //self.setupImage2()
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
    
    func setupPuzzleView() {
        
        self.addSubview(puzzleOnboardingView)
        
        self.puzzleOnboardingView.prepareForConstraints()
        
        puzzleOnboardingView.pinLeft(30.0)
        puzzleOnboardingView.pinRight(30.0)
        puzzleOnboardingView.pinTop(50.0)
        
        puzzleOnboardingView.widthAnchor.constraint(equalTo: puzzleOnboardingView.heightAnchor).isActive = true
    }
    
    func setupImage1() {
        
        self.addSubview(viewImage1)
        self.viewImage1.addSubview(viewImage1Mask)
        
        //self.viewImage1Mask.prepareForConstraints()
        self.viewImage1.prepareForConstraints()
        
        viewImage1.pinLeft(30.0)
        viewImage1.pinRight(30.0)
        viewImage1.pinTop(50.0)
        
        viewImage1Mask.frame = viewImage1.bounds
        viewImage1Mask.bounds = viewImage1.bounds
        viewImage2Mask.frame.origin.x -= 30
        
//        viewImage1Mask.widthAnchor.constraint(equalTo: viewImage1.widthAnchor, multiplier: 2).isActive = true
//        viewImage1Mask.heightAnchor.constraint(equalTo: viewImage1.heightAnchor, multiplier: 1).isActive = true
//
//        viewImage1Mask.centerHorizontally()
//
//        viewImage1Mask.centerVertically(12)
        
        viewImage1.widthAnchor.constraint(equalTo: viewImage1.heightAnchor).isActive = true
        
        //viewImage1.mask = viewImage1Mask
        
    }
    
    func setupImage2() {
        
        self.addSubview(viewImage2)
        self.viewImage2.addSubview(viewImage2Mask)
        
        self.viewImage2Mask.prepareForConstraints()
        self.viewImage2.prepareForConstraints()
        
        viewImage2.pinLeft(30.0)
        viewImage2.pinRight(30.0)
        viewImage2.pinTop(50.0)
        
        viewImage2Mask.widthAnchor.constraint(equalTo: viewImage2.widthAnchor, multiplier: 2).isActive = true
        viewImage2Mask.heightAnchor.constraint(equalTo: viewImage2.heightAnchor, multiplier: 1).isActive = true
        
        viewImage2Mask.centerHorizontally()
        viewImage2Mask.centerVertically(-12)
        
        viewImage2.widthAnchor.constraint(equalTo: viewImage2.heightAnchor).isActive = true
        
    }
    
}
