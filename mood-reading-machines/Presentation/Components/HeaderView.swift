//
//  HeaderView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 11/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    lazy var headerImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var followersLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var followingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 300.0, height: 200.0))
        self.setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        self.addSubview(headerImage)
        self.addSubview(nameLabel)
        self.addSubview(followersLabel)
        self.addSubview(followingLabel)
        self.addSubview(backgroundImage)
        
        self.headerImage.prepareForConstraints()
        self.nameLabel.prepareForConstraints()
        self.followingLabel.prepareForConstraints()
        self.followersLabel.prepareForConstraints()
        self.backgroundImage.prepareForConstraints()
        
    }
    
}
