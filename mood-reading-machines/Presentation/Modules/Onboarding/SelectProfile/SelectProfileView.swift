//
//  SelectProfileView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 28/11/18.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SelectProfileView: UIViewController {
    
    var viewModel: SelectProfileViewModel!
    let baseView = SelectProfileBaseView()
    
    let repository: TwitterRepository
    
    weak var delegate: AppActionable?

    init(repository: TwitterRepository) {
        self.repository = repository
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

extension SelectProfileView {
    
    func setupViewModel() {
        let input = self.baseView.cloudView.rx.tagSelected
        self.viewModel = SelectProfileViewModel(input: input,
                                                repository: self.repository)
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {
        self.viewModel.usernames
            .drive(self.baseView.cloudView.rx.items)
            .disposed(by: rx.disposeBag)
        
        self.viewModel.isLoading
            .drive(onNext: showLoading)
            .disposed(by: rx.disposeBag)
        
        self.viewModel.selectedUser
            .drive(onNext: { user in
                self.delegate?.handle(.finishOnboarding(user: user))
            }).disposed(by: rx.disposeBag)
        
        //TODO: show error!
    }
    
    func showLoading(_ isLoading: Bool) {
        if isLoading {
            self.baseView.loadingView.start()
        } else {
            self.baseView.loadingView.stop()
        }
    }
}
