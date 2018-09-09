//
//  CoreMLMoodService.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import CoreML
import RxSwift

final class CoreMLMoodService: MoodReadingService {
    
    private enum Error: Swift.Error {
        case featuresMissing
    }
    
    private let model = SentimentPolarity()
    private let options: NSLinguisticTagger.Options = [.omitWhitespace, .omitPunctuation, .omitOther]
    
    private lazy var tagger: NSLinguisticTagger = .init(
        tagSchemes: NSLinguisticTagger.availableTagSchemes(forLanguage: "en"),
        options: Int(self.options.rawValue)
    )
    
    func predictMood(_ string: String) -> Sentiment {
        do {
            let inputFeatures = features(from: string)
            // Make prediction only with 2 or more words
            guard inputFeatures.count > 1 else {
                throw Error.featuresMissing
            }
            
            let output = try model.prediction(input: inputFeatures)
            
            switch output.classLabel {
            case "Pos":
                return .positive
            case "Neg":
                return .negative
            default:
                return .neutral
            }
        } catch {
            return .neutral
        }
    }
}

// MARK: - Features

private extension CoreMLMoodService {
    func features(from text: String) -> [String: Double] {
        var wordCounts = [String: Double]()
        
        tagger.string = text
        let range = NSRange(location: 0, length: text.utf16.count)
        
        // Tokenize and count the sentence
        tagger.enumerateTags(in: range, scheme: .nameType, options: options) { _, tokenRange, _, _ in
            let token = (text as NSString).substring(with: tokenRange).lowercased()
            // Skip small words
            guard token.count >= 3 else {
                return
            }
            
            if let value = wordCounts[token] {
                wordCounts[token] = value + 1.0
            } else {
                wordCounts[token] = 1.0
            }
        }
        
        return wordCounts
    }
}
