//
//  EnterUsernameView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EnterUsernameView: UIViewController {
    
    var viewModel: EnterUsernameViewModel!
    let baseView = EnterUsernameBaseView()
    
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

extension EnterUsernameView {
    
    func setupViewModel() {
        self.viewModel = EnterUsernameViewModel(
            input: self.baseView.textField.rx.text.orEmpty.asSignal(onErrorJustReturn: ""),
            continueTap: self.baseView.continueButton.rx.tap.asSignal(),
            repository: self.repository)
    }
    
    func configureViews() {
        //self.baseView.textField.becomeFirstResponder()
    }
    
    func setupBindings() {
        self.viewModel.isLoading
            .drive(self.baseView.activityIndicator.rx.isLoading)
            .disposed(by: rx.disposeBag)
        
        self.viewModel.isValid
            .drive(onNext: {
                print($0)
            }).disposed(by: rx.disposeBag)
        
        self.viewModel.isValid
            .drive(self.baseView.continueButton.rx.isEnabled)
            .disposed(by: rx.disposeBag)
        
        self.viewModel.selectedUser
            .drive(onNext: { user in
                self.delegate?.handle(.finishOnboarding(user: user))
            }).disposed(by: rx.disposeBag)
    }
}
