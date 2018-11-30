//
//  MainBaseView.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

class MainBaseView: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    lazy var headerView: HeaderView = HeaderView()
    
    init() {
        super.init(frame: CGRect.zero)
        self.setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSubviews()
    }
    
    func setupSubviews() {
        self.backgroundColor = .white
        self.addSubview(tableView)
        self.addSubview(headerView)
        
        self.tableView.prepareForConstraints()
        self.headerView.prepareForConstraints()
        
        self.tableView.pinEdgesToSuperview()
        
        self.headerView.pinTop()
        self.headerView.pinLeft()
        self.headerView.pinRight()
        
    }
    
}
