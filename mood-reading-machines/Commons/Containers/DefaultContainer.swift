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
        self.registerRepositories()
        self.registerViews()
        self.registerStorage()
    }
    
}

//Register Views
extension DefaultContainer {
    
    func registerViews() {
        
        self.container.register(OnboardingView.self) { resolver in
            return OnboardingView(enterUsernameView: resolver.resolve(EnterUsernameView.self)!)
        }
        
        self.container.register(EnterUsernameView.self) { resolver in
            return EnterUsernameView(repository: resolver.resolve(TwitterRepository.self)!)
        }
        
        self.container.register(MainView.self) { resolver in
            return MainView(twitterRepository: resolver.resolve(TwitterRepository.self)!,
                     moodReadingService: resolver.resolve(MoodReadingService.self)!)
        }
        
    }
    
}

//Register Services
extension DefaultContainer {
    
    func registerServices() {
        
        self.container.register(TwitterService.self) { _ in
            let provider = MoyaProvider<TwitterMoyaRouter>(plugins: self.getDefaultPlugins())
            return TwitterMoyaService(provider: provider)
        }
        
        self.container.register(MoodReadingService.self) { _ in
            return CoreMLMoodService()
        }
        
    }
    
    func getDefaultPlugins() -> [PluginType] {
        #if DEBUG
        return [NetworkLoggerPlugin(verbose: true)]
        #else
        return []
        #endif
    }
    
}

extension DefaultContainer {
    
    func registerRepositories() {
        
        self.container.register(TwitterRepository.self) { resolver in
            return APITwitterRepository(
                service: resolver.resolve(TwitterService.self)!,
                storage: resolver.resolve(LocalStorage.self)!)
        }
        
    }
    
}

//Register Services
extension DefaultContainer {
    
    func registerStorage() {
        self.container.register(LocalStorage.self) { _ in
            return KeychainStorage()
        }
    }
    
}
