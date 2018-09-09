//
//  TwitterMoyaService.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import Moya
import RxSwift

class TwitterMoyaService: TwitterService {
    
    let provider: MoyaProvider<TwitterMoyaRouter>
    
    init(provider: MoyaProvider<TwitterMoyaRouter>) {
        self.provider = provider
    }
    
    func authenticate() -> Single<TwitterAccessToken> {
        return self.provider.rx.request(.authenticate)
            .map(TwitterAccessToken.self)
    }
    
    func getUser(_ displayName: String) -> Single<User> {
        return self.provider.rx.request(.getUser(displayName: displayName))
            .map(User.self)
    }
    
    func getTweets(_ displayName: String) -> Single<[Tweet]> {
        return self.provider.rx.request(.getTweets(displayName: displayName))
            .map([Tweet].self)
    }
    
}
