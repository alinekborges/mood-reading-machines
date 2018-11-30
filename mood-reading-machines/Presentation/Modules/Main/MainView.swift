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
import Kingfisher

class MainView: UIViewController {
    
    var viewModel: MainViewModel!
    let baseView = MainBaseView()
    
    let twitterRepository: TwitterRepository
    let moodReadingService: MoodReadingService
    let storage = KeychainStorage()
    var user: User!
    
    //weak var delegate: AppActionable?

    init(twitterRepository: TwitterRepository, moodReadingService: MoodReadingService) {
        self.twitterRepository = twitterRepository
        self.moodReadingService = moodReadingService
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
        self.viewModel = MainViewModel(user: self.user,
                                       twitterRepository: self.twitterRepository,
                                       moodReadingService: self.moodReadingService)
    }
    
    func configureViews() {
        self.baseView.tableView.register(TweetCell.self, forCellReuseIdentifier: "TweetCell")
        self.baseView.tableView.rowHeight = UITableViewAutomaticDimension
        self.baseView.tableView.estimatedRowHeight = 200
        self.baseView.tableView.contentInset.top = self.baseView.headerView.maxHeight
        
        if let url = URL(string: self.user.profileBackgroundImageUrl) {
            self.baseView.headerView.backgroundImage.kf.setImage(with: url)
        }
        
    }
    
    func setupBindings() {
        
        self.viewModel.username
            .drive(self.baseView.headerView.usernameLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
        self.viewModel.tweets
            .drive(self.baseView.tableView.rx
                .items(cellIdentifier: "TweetCell",
                       cellType: TweetCell.self)) { _, element, cell in
                        cell.bind(element)
            }.disposed(by: rx.disposeBag)
        
        self.baseView.tableView.rx.contentOffset
            .map { $0.y }
            .map(currentScrollPercentage)
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: self.baseView.headerView.rx.fractionComplete)
            .disposed(by: rx.disposeBag)
    
    }
    
    func currentScrollPercentage(_ offset: CGFloat) -> CGFloat {
        return (offset + self.baseView.headerView.maxHeight) /
            (self.baseView.headerView.minHeight + self.baseView.headerView.maxHeight)
    }
}
