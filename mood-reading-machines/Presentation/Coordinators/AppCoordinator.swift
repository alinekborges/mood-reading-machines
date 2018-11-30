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
    case finishOnboarding(user: User)
    case openInfo
}

protocol AppActionable: class {
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
            UIView.transition(with: self.window, duration: 0.1, options: .transitionCrossDissolve, animations: {
                self.window.rootViewController = newValue
            }, completion: nil)
        }
    }
    
    init(window: UIWindow, container: Container) {
        self.window = window
        self.container = container
    }
    
    func start() {
        if let user = storage.user {
            showMainView(user: user)
        } else {
            showOnboarding()
        }
    }
    
}

extension AppCoordinator: AppActionable {
    
    func handle(_ action: AppAction) {
        switch action {
        case .finishOnboarding(let user):
            self.storage.user = user
            self.showMainView(user: user)
        case .openInfo:
            self.showInfoView()
        }
    }
    
}

extension AppCoordinator {
    
    fileprivate func showOnboarding() {
        let view = container.resolve(OnboardingView.self)!
        view.delegate = self
        self.currentView = view
    }
    
    fileprivate func showMainView(user: User) {
        let view = container.resolve(MainView.self)!
        view.user = user
        view.delegate = self
        self.currentView = view
    }
    
    fileprivate func showInfoView() {
        let view = container.resolve(InfoView.self)!
        view.modalPresentationStyle = .overCurrentContext
        self.currentView?.present(view, animated: false, completion: nil)
    }
}
