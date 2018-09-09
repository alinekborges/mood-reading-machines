//
//  MainViewModel.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import RxSwift
import RxCocoa
import RxSwiftExt
import RxSwiftUtilities

class MainViewModel {
    
    let tweets: Driver<[TweetDisplay]>
    
    init(user: User, twitterRepository: TwitterRepository, moodReadingService: MoodReadingService) {
        
        let tweetsResult = twitterRepository
            .getTweets(user.screenName)
            .map { array in
                array.map { TweetDisplay(tweet: $0,
                                         mood: moodReadingService.predictMood($0.text)) }
            }
            .asObservable()
            .materialize()
            .share()
        
        self.tweets = tweetsResult
            .elements()
            .asDriver(onErrorJustReturn: [])

    }
}
