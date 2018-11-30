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
    
    var openAnimator: UIViewPropertyAnimator?
    var closeAnimator: UIViewPropertyAnimator?
    
    var offset: CGFloat = 100.0

    init(originFrame: CGRect) {
        self.originFrame = originFrame
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
            self.baseView.container.frame = self.view.bounds
        })
        
        self.openAnimator?.startAnimation()
    }
}

extension MoodView {
    
    func setupViewModel() {
        self.viewModel = MoodViewModel()
    }
    
    func configureViews() {
        self.view.backgroundColor = .clear
        self.baseView.backgroundColor = .clear
        
        self.setupGestureRecognizer()
    }
    
    func setupGestureRecognizer() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handle(_:)))
        self.baseView.container.addGestureRecognizer(panGesture)
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
        })
        
        self.closeAnimator?.addCompletion({ _ in
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    func setupBindings() {

    }
}
