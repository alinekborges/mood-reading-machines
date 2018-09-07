//
//  DefaultContainer.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import Swinject
import Moya

final class DefaultContainer {
    
    let container: Container
    
    init() {
        self.container = Container()
        self.registerServices()
        self.registerViews()
        self.registerStorage()
    }
    
}

//Register Views
extension DefaultContainer {
    
    func registerViews() {
        
        self.container.register(OnboardingView.self) { resolver in
            OnboardingView()
        }
        
        self.container.register(MainView.self) { resolver in
            MainView()
        }
        
    }
    
}

//Register Services
extension DefaultContainer {
    
    func registerServices() {
        
    }
    
}

//Register Services
extension DefaultContainer {
    
    func registerStorage() {
        self.container.register(LocalStorage.self) { _ in
            return UserDefaultsStorage()
        }
    }
    
}
