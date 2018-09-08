//
//  MainView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainView: UIViewController {
    
    var viewModel: MainViewModel!
    let baseView = MainBaseView()
    
    let twitterService: TwitterService
    let storage = KeychainStorage()
    
    //weak var delegate: AppActionable?

    init(twitterService: TwitterService) {
        self.twitterService = twitterService
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

extension MainView {
    
    func setupViewModel() {
        self.viewModel = MainViewModel()
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {
        //TODO: Just testing out, please remove
        self.twitterService.authenticate()
            .map { self.storage.accessToken = $0.accessToken }
            .flatMap {
                return self.twitterService.searchUsers("elonmusk")
            }.subscribe(onSuccess: { tweets in
                print(tweets)
            }).disposed(by: rx.disposeBag)
    }
}
