//
//  MockTwitterRepository.swift
//  mood-reading-machinesTests
//
//  Created by Aline Borges on 09/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift

@testable import mood_reading_machines

enum MockError: Error {
    case generic
}

class MockTwitterRepository: TwitterRepository {
    
    var isSuccess: Bool = true
    
    func getUser(_ displayName: String) -> Single<User> {
        if isSuccess {
            return Single.just(DataMock.user)
        } else {
            return Single.error(MockError.generic)
        }
    }
    
    func getTweets(_ displayName: String) -> Single<[Tweet]> {
        if isSuccess {
            return Single.just(DataMock.tweets)
        } else {
            return Single.error(MockError.generic)
        }
    }
}
