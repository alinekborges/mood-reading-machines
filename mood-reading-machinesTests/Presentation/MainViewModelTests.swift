//
//  MainViewModelTests.swift
//  mood-reading-machinesTests
//
//  Created by Aline Borges on 09/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift
import Nimble
import XCTest
import RxBlocking

@testable import mood_reading_machines

class MainViewModelTests: XCTestCase {
    
    var viewModel: MainViewModel!
    var repository: MockTwitterRepository!
    var moodReadingService: MockMoodReadingService!
    
    var user = DataMock.user
    
    let disposeBag = DisposeBag()
    
    //Before each
    override func setUp() {
        self.repository = MockTwitterRepository()
        self.moodReadingService = MockMoodReadingService()
        
        self.viewModel = MainViewModel(
            user: self.user,
            twitterRepository: self.repository,
            moodReadingService: self.moodReadingService)
    }
    
    //After each
    override func tearDown() {
        self.viewModel = nil
        self.repository = nil
        self.moodReadingService = nil
    }
    
    func test_tweets_shouldBeMapped_toExpectedMood() {
        moodReadingService.mood = .positive
        
        let tweets = try! self.viewModel.tweets
            .toBlocking()
            .first()
        
        tweets?.forEach {
            XCTAssert($0.mood == .positive)
        }
    }
    
    func test_tweetDisplayModel_shouldContain_TweetText() {
        
        let tweets = try! self.viewModel.tweets
            .toBlocking()
            .first()
        
        zip(tweets!, DataMock.tweets).forEach { tweetDisplay, tweet in
            expect(tweetDisplay.text).to(match(tweet.text))
        }
    }
    
}
