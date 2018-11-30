//
//  MoodView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 29/11/18.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MoodView: UIViewController {
    
    var viewModel: MoodViewModel!
    let baseView = MoodBaseView()
    
    //weak var delegate: AppActionable?
    
    let originFrame: CGRect
    let tweet: TweetDisplay
    
    var openAnimator: UIViewPropertyAnimator?
    var closeAnimator: UIViewPropertyAnimator?
    
    var offset: CGFloat = 100.0

    init(originFrame: CGRect, tweet: TweetDisplay) {
        self.originFrame = originFrame
        self.tweet = tweet
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
        self.setupViewModel()
        self.configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.baseView.container.frame = self.originFrame
        self.view.layoutIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.offset = self.view.frame.height - self.originFrame.height
        open()
    }
    
    func open() {
        self.openAnimator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
            self.baseView.container.frame = self.endFrame()
            self.baseView.blurView.effect = UIBlurEffect(style: .light)
            self.baseView.cardView.backgroundColor = self.viewModel.backgroundColor
            self.baseView.feelingLabel.alpha = 1.0
        })
        
        self.openAnimator?.startAnimation()
    }
    
    func endFrame() -> CGRect {
        let endHeight = self.view.bounds.height * 0.6
        return CGRect(x: 0, y: self.view.frame.midY - endHeight / 2, width: self.view.bounds.width, height: endHeight)
    }
}

extension MoodView {
    
    func setupViewModel() {
        self.viewModel = MoodViewModel(tweet: self.tweet)
    }
    
    func configureViews() {
        self.view.backgroundColor = .clear
        self.baseView.backgroundColor = .clear
        
        self.setupGestureRecognizer()
        
        self.baseView.titleLabel.font = self.baseView.titleLabel.font.withSize(self.viewModel.fontSize)
        self.baseView.titleLabel.text = self.viewModel.text
        self.baseView.feelingLabel.text = self.viewModel.feeling + "\n" + self.viewModel.emoji
    }
    
    func setupGestureRecognizer() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handle(_:)))
        self.baseView.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.baseView.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ gesture: UITapGestureRecognizer) {
        setupCloseAnimator()
        closeAnimator?.startAnimation()
    }
    
    @objc func handle(_ gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: view)
    
        switch gesture.state {
        case .began:
            setupCloseAnimator()
        case .changed:
            let fraction = abs(translation.y / self.offset)
            self.closeAnimator?.fractionComplete = fraction
        case .ended: self.closeAnimator?.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        default:
            break
        }
        
    }
    
    func setupCloseAnimator() {
        self.closeAnimator = UIViewPropertyAnimator(duration: 0.4, curve: .easeOut, animations: {
            self.baseView.container.frame = self.originFrame
            self.baseView.blurView.effect = nil
            self.baseView.cardView.backgroundColor = .white
            self.baseView.feelingLabel.alpha = 0.0
        })
        
        self.closeAnimator?.addCompletion({ _ in
            self.dismiss(animated: false, completion: nil)
        })
    }
}
