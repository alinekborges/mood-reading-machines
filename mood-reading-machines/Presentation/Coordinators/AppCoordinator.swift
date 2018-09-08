//
//  AppCoordinator.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit
import Swinject

enum AppAction {
    case finishOnboarding(user: String)
}

protocol AppActionable {
    func handle(_ action: AppAction)
}

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    let container: Container
    lazy var storage: LocalStorage = {
        container.resolve(LocalStorage.self)!
    }()
    
    var currentView: UIViewController? {
        get {
            return window.rootViewController
        }
        set {
            UIView.transition(with: self.window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.window.rootViewController = newValue
            }, completion: nil)
        }
    }
    
    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
    }
    
    func start() {
        
        showMainView("alieeen")
        return 
        
        if storage.user == nil {
            showOnboarding()
        } else {
            //TODO: restore user
            showMainView("alieeen")
        }
    }
    
}

extension AppCoordinator: AppActionable {
    
    func handle(_ action: AppAction) {
        switch action {
        case .finishOnboarding(let user):
            self.showMainView(user)
        }
    }
    
}

extension AppCoordinator {
    
    fileprivate func showOnboarding() {
        let view = container.resolve(OnboardingView.self)!
        self.currentView = view
    }
    
    fileprivate func showMainView(_ user: String) {
        let view = container.resolve(MainView.self)!
        self.currentView = view
    }
    
}
