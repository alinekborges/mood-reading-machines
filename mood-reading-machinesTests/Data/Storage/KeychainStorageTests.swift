//
//  KeychainStorageTests.swift
//  mood-reading-machinesTests
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import Nimble
import XCTest
import SwiftKeychainWrapper

@testable import mood_reading_machines

class KeychainStorageTests: XCTestCase {
    
    var storage: KeychainStorage!
    var keychain: KeychainWrapper!
    
    let user = User(name: "test",
                    followersCount: 199,
                    followingCount: 199,
                    profileBackgroundColor: "#AAAAAA",
                    profileBackgroundImageUrl: "http://www.test.com/background.jpg",
                    profileImageUrl: "http://www.test.com/profile.jpg")
    
    //Before Each
    override func setUp() {
        self.keychain = KeychainWrapper(serviceName: "test_case")
        self.storage = KeychainStorage(keychain: keychain)
    }
    
    //After each
    override func tearDown() {
        self.storage.clear()
        self.keychain = nil
        self.storage = nil
    }
    
    func test_user_shouldBeNil_atTheFirstTime() {
        expect(self.storage.user).to(beNil())
    }
    
    func test_user_shouldBeSaved_onSet() {
        
        //save user
        self.storage.user = user
        
        //restore user
        let data = self.keychain.data(forKey: LocalStorageKeys.user)
        let restoredUser = try? JSONDecoder().decode(User.self, from: data!)
        
        expect(restoredUser).to(equal(user))
    }
    
    func test_accessToken_shouldBeSaved_onSet() {
        
        let token = "access_token"
        
        //save accessToken
        self.storage.accessToken = token
        
        //restore token
        let restoredToken = self.keychain.string(forKey: LocalStorageKeys.accessToken)
        
        expect(restoredToken).to(equal(token))
    }
    
    func test_keychain_shouldBeEmpty_onClear() {
        
        let token = "access_token"
        
        self.storage.accessToken = token
        self.storage.user = user
        
        self.storage.clear()
        
        let restoredToken = self.keychain.string(forKey: LocalStorageKeys.user)
        let restoredUser = self.keychain.data(forKey: LocalStorageKeys.user)
        
        expect(restoredToken).to(beNil())
        expect(restoredUser).to(beNil())
        
    }
}

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name &&
            lhs.followersCount == rhs.followersCount &&
            lhs.profileBackgroundColor == rhs.profileBackgroundColor &&
            lhs.profileBackgroundImageUrl == rhs.profileBackgroundImageUrl &&
            lhs.profileImageUrl == rhs.profileImageUrl
    }
}
