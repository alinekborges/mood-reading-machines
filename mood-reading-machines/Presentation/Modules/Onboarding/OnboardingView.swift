//
//  OnboardingView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class OnboardingView: UIViewController {
    
    var viewModel: OnboardingViewModel!
    lazy var baseView = OnboardingBaseView(enterUsernameView: self.enterUsernameView)
    let enterUsernameView: EnterUsernameView
    var animator: UIViewPropertyAnimator?
    
    var pausedTime: CGFloat = 0.0
    
    weak var delegate: AppActionable? {
        didSet {
            self.enterUsernameView.delegate = self.delegate
        }
    }

    init(enterUsernameView: EnterUsernameView) {
        self.enterUsernameView = enterUsernameView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureViews()
        self.setupViewModel()
        self.setupBindings()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupAnimations()
    }
    
}

extension OnboardingView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let percent = (scrollView.contentOffset.x / (scrollView.contentSize.width - self.view.frame.width)) * 2
        
        animator?.fractionComplete = percent

    }
}

extension OnboardingView {
    
    func setupViewModel() {
        self.viewModel = OnboardingViewModel()
    }
    
    func configureViews() {
        self.baseView.scrollView.delegate = self
        
    }
    
    func setupAnimations() {
        
        print(self.baseView.viewImage1.bounds)
        let maskView = UIView(frame: self.baseView.viewImage1.bounds)
        maskView.backgroundColor = .red
        maskView.layer.cornerRadius = 10
        self.baseView.viewImage1.addSubview(maskView)
        
        maskView.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        let rotation = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
        let translation = CGAffineTransform(translationX: 0, y: 20)
        maskView.transform = rotation.concatenating(translation)
        self.baseView.viewImage1.mask = maskView
        
        
        self.animator = UIViewPropertyAnimator(duration: 2, curve: .linear, animations: {
            maskView.transform = CGAffineTransform.identity
        })
        
        
        
//        self.baseView.viewImage1Mask.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
//        self.baseView.viewImage1Mask.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
//
//        self.baseView.viewImage2Mask.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
//        self.baseView.viewImage2Mask.transform = CGAffineTransform(rotationAngle: -(CGFloat.pi / 4) * 3)
//
//        self.animator = UIViewPropertyAnimator(duration: 2, curve: .linear, animations: {
//            self.baseView.viewImage1Mask.transform = CGAffineTransform.identity
//            self.baseView.viewImage2Mask.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
//        })
//
//        self.animator?.pausesOnCompletion = false
    }
    
    func setupBindings() {

    }
}
