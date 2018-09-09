//
//  TwitterService.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift

protocol TwitterService {
    func authenticate() -> Single<TwitterAccessToken>
    func getUser(_ displayName: String) -> Single<User>
    func getTweets(_ displayName: String) -> Single<[Tweet]>
}
