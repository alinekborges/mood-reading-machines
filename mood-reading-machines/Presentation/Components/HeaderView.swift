//
//  HeaderView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 11/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class HeaderView: UIView {
    
    var heightConstraint: NSLayoutConstraint!
    
    let maxHeight: CGFloat = 160
    let minHeight: CGFloat = 90
    
    private var animator: UIViewPropertyAnimator?
    
    var fractionComplete: CGFloat = 0.0 {
        didSet {
            self.animator?.fractionComplete = fractionComplete
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 30, height: self.maxHeight)
    }
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32.0)
        label.textColor = .slate
        label.textAlignment = .center
        return label
    }()
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .slate
        return image
    }()
    
    lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        return view
    }()
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 300.0, height: 200.0))
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        self.addSubview(backgroundImage)
        self.addSubview(blurView)
        self.addSubview(usernameLabel)
        
        self.backgroundImage.prepareForConstraints()
        self.usernameLabel.prepareForConstraints()
        self.blurView.prepareForConstraints()
        
        self.backgroundImage.pinEdgesToSuperview()
        self.blurView.pinEdgesToSuperview()
        
        self.usernameLabel.pinLeft()
        self.usernameLabel.pinRight()
        self.usernameLabel.pinBottom()
        self.usernameLabel.pinSafeTop()
        
        setupAnimator()
    }
    
    private func setupAnimator() {
        
        var topPadding: CGFloat = 0.0
        
        if #available(iOS 11.0, *) {
            if let window = UIApplication.shared.delegate!.window {
                topPadding = window?.safeAreaInsets.top ?? 0.0
            }
        }
        
        self.heightConstraint = self.constraintHeight(self.maxHeight + topPadding)
        
        self.animator = UIViewPropertyAnimator(duration: 0.25, curve: .linear, animations: {
            self.heightConstraint.constant = self.minHeight + topPadding
            self.usernameLabel.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.blurView.effect = UIBlurEffect(style: .light)
            self.superview?.layoutIfNeeded()
            self.layoutIfNeeded()
        })
        
        self.animator?.pausesOnCompletion = true
        
    }
    
}

extension Reactive where Base: HeaderView {
    
    var fractionComplete: Binder<CGFloat> {
        return Binder(self.base) { header, fractionComplete in
            header.fractionComplete = fractionComplete
        }
    }
}
