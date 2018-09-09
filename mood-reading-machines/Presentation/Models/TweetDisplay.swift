//
//  TweetDisplay.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 09/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation

struct TweetDisplay {
    let text: String
    var mood: Sentiment
    
    init(tweet: Tweet, mood: Sentiment) {
        self.text = tweet.text
        self.mood = mood
    }
}
