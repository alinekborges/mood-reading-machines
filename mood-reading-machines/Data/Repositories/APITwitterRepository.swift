//
//  APITwitterRepository.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift

class APITwitterRepository: TwitterRepository {
    
    let service: TwitterService
    let storage: LocalStorage
    
    init(service: TwitterService, storage: LocalStorage) {
        self.service = service
        self.storage = storage
    }
    
    func getUser(_ displayName: String) -> Single<User> {
        return self.ensureAuthentication()
            .flatMap { _ in
                return self.service.getUsers(displayName)
        }
    }
    
    func getTweets(_ displayName: String) -> Single<[Tweet]> {
        return self.ensureAuthentication()
            .flatMap { _ in
                return self.service.getTweets(displayName)
        }
    }
    
    private func ensureAuthentication() -> Single<Void> {
        if storage.accessToken != nil {
            return Single.just(())
        }
        
        return service.authenticate()
            .do(onSuccess: { self.storage.accessToken = $0.accessToken })
            .map { _ in return () }
    }
    
}
