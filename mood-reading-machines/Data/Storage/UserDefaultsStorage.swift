//
//  UserDefaultsStorage.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift

struct LocalStorageKeys {
    private init() {}
    
    static let isLoggedIn = "logged_in"
    static let accessToken = "twitter_access_token"
}

class UserDefaultsStorage: LocalStorage {
    
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
        userDefaults.register(defaults: [LocalStorageKeys.isLoggedIn: false])
    }
    
    var isLoggedIn: Bool {
        get {
            return userDefaults.bool(forKey: LocalStorageKeys.isLoggedIn)
        } set {
            userDefaults.set(newValue, forKey: LocalStorageKeys.isLoggedIn)
        }
    }
    
    //TODO: Do this in keychain, not User Defaults
    var accessToken: String? {
        get {
            return userDefaults.string(forKey: LocalStorageKeys.accessToken)
        } set {
            userDefaults.set(newValue, forKey: LocalStorageKeys.accessToken)
        }
    }
    
    func clear() {
        userDefaults.removeObject(forKey: LocalStorageKeys.isLoggedIn)
    }
    
}
