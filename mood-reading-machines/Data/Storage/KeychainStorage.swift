//
//  KeychainStorage.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 07/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift
import SwiftKeychainWrapper

struct LocalStorageKeys {
    private init() {}
    
    static let user = "saved_user"
    static let accessToken = "twitter_access_token"
}

class KeychainStorage: LocalStorage {
    
    let keychain: KeychainWrapper
    
    init(keychain: KeychainWrapper = KeychainWrapper.standard) {
        self.keychain = keychain
    }
    
    var user: User? {
        get {
            guard let value = keychain.data(forKey: LocalStorageKeys.user) else { return nil }
            return try? JSONDecoder().decode(User.self, from: value)
        } set {
            guard let encoded = try? JSONEncoder().encode(newValue) else { return }
            keychain.set(encoded, forKey: LocalStorageKeys.user)
        }
    }
    
    var accessToken: String? {
        get {
            return keychain.string(forKey: LocalStorageKeys.accessToken)
        } set {
            guard let value = newValue else { return }
            keychain.set(value, forKey: LocalStorageKeys.accessToken)
        }
    }
    
    func clear() {
        keychain.removeObject(forKey: LocalStorageKeys.user)
        keychain.removeObject(forKey: LocalStorageKeys.accessToken)
    }
    
}
