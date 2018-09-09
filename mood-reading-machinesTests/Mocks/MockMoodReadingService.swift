//
//  MockMoodReadingService.swift
//  mood-reading-machinesTests
//
//  Created by Aline Borges on 09/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation

@testable import mood_reading_machines

class MockMoodReadingService: MoodReadingService {
    
    var mood: Sentiment = .neutral
    
    func predictMood(_ string: String) -> Sentiment {
        return mood
    }
    
}
