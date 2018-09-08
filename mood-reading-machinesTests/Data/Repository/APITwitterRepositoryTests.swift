//
//  APITwitterRepositoryTests.swift
//  mood-reading-machinesTests
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import Nimble
import XCTest
import RxSwift

@testable import mood_reading_machines

class APITwitterRepositoryTests: XCTestCase {
    
    var repository: APITwitterRepository!
    var service: MockTwitterService!
    var storage: MockLocalStorage!
    
    let disposeBag = DisposeBag()
    
    //Before each
    override func setUp() {
        self.service = MockTwitterService()
        self.storage = MockLocalStorage()
        self.repository = APITwitterRepository(service: service, storage: storage)
    }
    
    //After each
    override func tearDown() {
        self.storage.clear()
        self.service = nil
        self.storage = nil
        self.repository = nil
    }
    
    func test_authentication_shouldBeInvoked_whenGettingUserNotAuthenticated() {
        
        self.repository.getUser("test_user")
            .subscribe(onSuccess: { _ in }, onError: { _ in })
            .disposed(by: rx.disposeBag)
        
        expect(self.service.authenticationInvoked).toEventually(beTrue())
        
    }
    
    func test_authentication_shouldBeInvoked_whenGettingTweetsNotAuthenticated() {
        
        self.repository.getTweets("test_user")
            .subscribe(onSuccess: { _ in }, onError: { _ in })
            .disposed(by: rx.disposeBag)
        
        expect(self.service.authenticationInvoked).toEventually(beTrue())
        
    }
    
    func test_authentication_shouldNOTbeInvoked_whenGettingUserAlreadyAuthenticated() {
        
        self.storage.accessToken = "access_token"
        
        self.repository.getUser("test_user")
            .subscribe(onSuccess: { _ in }, onError: { _ in })
            .disposed(by: rx.disposeBag)
        
        expect(self.service.authenticationInvoked).toNotEventually(beTrue())
        
    }
    
    func test_authentication_shouldNOTbeInvoked_whenGettingTweetsAlreadyAuthenticated() {
        
        self.storage.accessToken = "access_token"
        
        self.repository.getTweets("test_user")
            .subscribe(onSuccess: { _ in }, onError: { _ in })
            .disposed(by: rx.disposeBag)
        
        expect(self.service.authenticationInvoked).toNotEventually(beTrue())
        
    }
    
    func test_authentication_shouldBeSaved_afterFirstAuthentication() {
        
        self.repository.getTweets("test_user")
            .subscribe(onSuccess: { _ in }, onError: { _ in })
            .disposed(by: rx.disposeBag)
        
        expect(self.storage.accessToken).toEventually(match("access_token"))
        
    }
    
}
