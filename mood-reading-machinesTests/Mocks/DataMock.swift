//
//  DataMock.swift
//  mood-reading-machinesTests
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
@testable import mood_reading_machines

struct DataMock {
    
    static let user = User(name: "test",
                           followersCount: 199,
                           followingCount: 199,
                           profileBackgroundColor: "#AAAAAA",
                           profileBackgroundImageUrl: "http://www.test.com/background.jpg",
                           profileImageUrl: "http://www.test.com/profile.jpg")
    
    static let tweets = [Tweet(text: "Test tweet")]
}
