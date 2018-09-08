//
//  MockService.swift
//  mood-reading-machinesTests
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift

@testable import mood_reading_machines

class MockTwitterService: TwitterService {
    
    let user = DataMock.user
    let tweets = DataMock.tweets
    
    var authenticationInvoked = false
    
    var isAuthenticated = false
    
    func authenticate() -> Single<TwitterAccessToken> {
        authenticationInvoked = true
        return Single.just(TwitterAccessToken(accessToken: "access_token"))
    }
    
    func getUser(_ displayName: String) -> Single<User> {
        return Single.just(self.user)
    }
    
    func getTweets(_ displayName: String) -> Single<[Tweet]> {
        return Single.just(self.tweets)
    }
    
}
