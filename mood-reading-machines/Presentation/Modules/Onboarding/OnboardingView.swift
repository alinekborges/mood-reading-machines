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
    
}

extension OnboardingView {
    
    func setupViewModel() {
        self.viewModel = OnboardingViewModel()
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}
