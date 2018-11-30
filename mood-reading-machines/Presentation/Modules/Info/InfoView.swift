//
//  InfoView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 30/11/18.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class InfoView: UIViewController {
    
    let baseView = InfoBaseView()
    
    let profilePicUrl = "https://avatars3.githubusercontent.com/u/5591222?s=400&u=b6dddaba5d09528299ec77918dfcf6c5b3efa9df&v=4"
    
    //weak var delegate: AppActionable?
    var animator: UIViewPropertyAnimator?

    init() {
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.start()
    }
    
    func start() {
        self.animator = UIViewPropertyAnimator(duration: 0.4, curve: .easeIn, animations: {
            self.baseView.blurView.effect = UIBlurEffect(style: .light)
        })
        self.animator?.startAnimation()
    }
    
}

extension InfoView {

    func configureViews() {
        self.baseView.descriptionLabel.text = R.string.localizable.info_description()
        self.baseView.nameLabel.text = R.string.localizable.info_name()
        self.baseView.githubLabel.text = R.string.localizable.info_github()
        self.baseView.linkedinLabel.text = R.string.localizable.info_linkedin()
        self.baseView.openSourceButton.setTitle(R.string.localizable.info_openSource(), for: .normal)
        self.baseView.profileImageView.kf.setImage(with: URL(string: self.profilePicUrl)!)
        
        self.baseView.openSourceButton.addTarget(self, action: #selector(self.openProject), for: UIControlEvents.touchUpInside)
    }
    
    @objc func openProject() {
        let url = URL(string: Constants.githubProject)
        url?.openInDefaultBrowser()
    }
}
