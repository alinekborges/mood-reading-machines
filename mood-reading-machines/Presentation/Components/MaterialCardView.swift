//
//  MaterialCardView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 29/11/18.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class MaterialCardView: UIView {
    
    init() {
        super.init(frame: CGRect.zero)
        configureShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureShadow()
    }
    
    override func prepareForInterfaceBuilder() {
        configureShadow()
    }
    
    func configureShadow() {
        self.layer.cornerRadius = 3.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.shouldRasterize = false
        self.backgroundColor = .white
        self.clipsToBounds = false
    }
    
}
