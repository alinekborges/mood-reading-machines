//
//  MoodReadingService.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift

protocol MoodReadingService {
    func predictMood(_ string: String) -> Single<Sentiment>
}
