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
    
    //weak var delegate: AppActionable?

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
        self.setupViewModel()
        self.setupBindings()
    }
    
}

extension EnterUsernameView {
    
    func setupViewModel() {
        self.viewModel = EnterUsernameViewModel()
    }
    
    func configureViews() {
        
    }
    
    func setupBindings() {

    }
}
