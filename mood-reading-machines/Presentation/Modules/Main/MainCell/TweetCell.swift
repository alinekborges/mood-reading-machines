//
//  TweetCell.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 09/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class TweetCell: UITableViewCell {
    
    lazy var view = TweetCellBaseView()
    
    var viewModel = TweetCellViewModel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(view)
        self.view.prepareForConstraints()
        self.view.pinEdgesToSuperview()
        self.setupBindings()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ tweet: TweetDisplay) {
        self.viewModel.bind(tweet)
    }
    
    func setupBindings() {
        self.viewModel.text
            .drive(view.titleLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
        self.viewModel.fontSize
            .drive(view.titleLabel.rx.fontSize)
            .disposed(by: rx.disposeBag)
    }
    
}
