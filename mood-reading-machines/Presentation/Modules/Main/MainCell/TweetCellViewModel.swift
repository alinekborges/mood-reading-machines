//
//  TweetCellViewModel.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 29/11/18.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class TweetCellViewModel {
    
    let tweet: PublishSubject<TweetDisplay>
    
    let text: Driver<String>
    //let date: Driver<String>
    let fontSize: Driver<CGFloat>
    
    init() {
        
        self.tweet = PublishSubject<TweetDisplay>()
        
        self.text = tweet
            .map { $0.text }
            .asDriver(onErrorJustReturn: "")
        
        self.fontSize = self.text
            .map {
                return $0.count < 80 ?
                    Constants.largeFontSize : Constants.mediumFontSize
        }
        
    }
    
    func bind(_ tweet: TweetDisplay) {
        self.tweet.onNext(tweet)
    }
    
}
