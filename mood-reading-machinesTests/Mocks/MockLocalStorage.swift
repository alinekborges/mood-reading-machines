//
//  MockLocalStorage.swift
//  mood-reading-machinesTests
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation

@testable import mood_reading_machines

class MockLocalStorage: LocalStorage {
    
    var accessToken: String?
    
    var user: User?
    
    func clear() {
        self.accessToken = nil
        self.user = nil
    }
    
    
}
