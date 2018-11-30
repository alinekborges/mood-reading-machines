//
//  MoodViewModel.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 29/11/18.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import RxSwift
import RxCocoa

class MoodViewModel {
    
    let fontSize: CGFloat
    let text: String
    let backgroundColor: UIColor
    let emoji: String
    let feeling: String
    
    init(tweet: TweetDisplay) {
        
        self.text = tweet.text
        
        self.fontSize = text.count < 80 ?
                    Constants.largeFontSize : Constants.mediumFontSize
        
        switch tweet.mood {
        case .positive:
            self.backgroundColor = UIColor.pastelYellow
            self.feeling = "HAPPY!"
            self.emoji = "😃😁😆"
        case .neutral:
            self.backgroundColor = UIColor.pastelGray
            self.feeling = "Kind of neutral"
            self.emoji = "🤨😐😶"
        case .negative:
            self.feeling = "Sad sad panda"
            self.emoji = "😔😩😓"
            self.backgroundColor = UIColor.pastelBlue
        }
        
    }
}
