//
//  TwitterAccessToken.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation

struct TwitterAccessToken: Codable {
    let accessToken: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessToken = try container.decode(String.self, forKey: .accessToken)
    }
}
