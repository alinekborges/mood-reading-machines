//
//  InfoBaseView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 30/11/18.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class InfoBaseView: UIView {
    
    lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        return view
    }()
    
    lazy var imageViewShadow: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 70
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowRadius = 10
        view.layer.shouldRasterize = false
        view.backgroundColor = .red
        view.clipsToBounds = false
        return view
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.borderWidth = 4.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .slate
        label.font = UIFont.systemFont(ofSize: 18, weight: .thin)
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .slate
        label.font = UIFont.systemFont(ofSize: 32, weight: .thin)
        return label
    }()
    
    lazy var githubLabel: UILabel = {
        let label = UILabel()
        label.textColor = .slate
        label.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        return label
    }()
    
    lazy var linkedinLabel: UILabel = {
        let label = UILabel()
        label.textColor = .slate
        label.font = UIFont.systemFont(ofSize: 22, weight: .thin)
        return label
    }()
    
    lazy var openSourceButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.numberOfLines = 0
        button.setTitleColor(.slate, for: .normal)
        button.layer.cornerRadius = 6.0
        button.titleLabel?.textAlignment = .center
        button.layer.borderColor = UIColor.slate.cgColor
        button.layer.borderWidth = 1.0
        button.backgroundColor = .white
        button.clipsToBounds = true
        return button
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
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
        self.backgroundColor = .clear
        self.addSubview(blurView)
        self.addSubview(containerView)
        self.containerView.addSubview(imageViewShadow)
        self.containerView.addSubview(profileImageView)
        self.containerView.addSubview(descriptionLabel)
        self.containerView.addSubview(nameLabel)
        self.containerView.addSubview(githubLabel)
        self.containerView.addSubview(linkedinLabel)
        self.containerView.addSubview(openSourceButton)
        
        self.containerView.prepareForConstraints()
        self.profileImageView.prepareForConstraints()
        self.descriptionLabel.prepareForConstraints()
        self.nameLabel.prepareForConstraints()
        self.githubLabel.prepareForConstraints()
        self.linkedinLabel.prepareForConstraints()
        self.openSourceButton.prepareForConstraints()
        self.blurView.prepareForConstraints()
        self.imageViewShadow.prepareForConstraints()
        
        self.blurView.pinEdgesToSuperview()
        
        self.containerView.centerVertically()
        self.containerView.pinLeft(30)
        self.containerView.pinRight(30)
        
        self.profileImageView.pinTop()
        self.profileImageView.centerHorizontally()
        self.profileImageView.widthAnchor
            .constraint(equalTo: self.profileImageView.heightAnchor, multiplier: 1)
            .isActive = true
        self.profileImageView.constraintHeight(140)
        self.profileImageView.layer.cornerRadius = 70
        
        self.imageViewShadow.pinTopInRelationTo(profileImageView.topAnchor)
        self.imageViewShadow.pinBottomInRelationTo(profileImageView.bottomAnchor)
        self.imageViewShadow.pinfLeftInRelationTo(profileImageView.leftAnchor)
        self.imageViewShadow.pinfRightInRelationTo(profileImageView.rightAnchor)
        
        self.descriptionLabel.pinTopInRelationTo(profileImageView.bottomAnchor, constant: 32)
        self.descriptionLabel.centerHorizontally()
        
        self.nameLabel.pinTopInRelationTo(descriptionLabel.bottomAnchor, constant: 4)
        self.nameLabel.centerHorizontally()
        
        self.githubLabel.pinTopInRelationTo(nameLabel.bottomAnchor, constant: 26)
        self.githubLabel.centerHorizontally()
        
        self.linkedinLabel.pinTopInRelationTo(githubLabel.bottomAnchor, constant: 6)
        self.linkedinLabel.centerHorizontally()
        
        self.openSourceButton.pinTopInRelationTo(linkedinLabel.bottomAnchor, constant: 26)
        self.openSourceButton.pinLeft()
        self.openSourceButton.pinRight()
        
        self.openSourceButton.pinBottom()
        
    }
    
}
