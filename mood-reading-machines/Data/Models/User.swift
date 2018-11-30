//
//  File.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: String
    let followersCount: Int
    let followingCount: Int
    let profileBackgroundColor: String
    let profileBackgroundImageUrl: String
    let profileImageUrl: String
    let screenName: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case followersCount = "followers_count"
        case followingCount = "friends_count"
        case profileBackgroundColor = "profile_background_color"
        case profileBackgroundImageUrl = "profile_background_image_url_https" //TODO: figure out how to get banner authenticated
        case profileImageUrl = "profile_image_url"
        case screenName = "screen_name"
    }
    
    init(name: String = "",
         followersCount: Int = 0,
         followingCount: Int = 0,
         profileBackgroundColor: String = "",
         profileBackgroundImageUrl: String = "",
         profileImageUrl: String = "",
         screenName: String = "") {
        self.name = name
        self.followersCount = followersCount
        self.followingCount = followingCount
        self.profileImageUrl = profileImageUrl
        self.profileBackgroundColor = profileBackgroundColor
        self.profileBackgroundImageUrl = profileBackgroundImageUrl
        self.screenName = screenName
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.followersCount = try container.decode(Int.self, forKey: .followersCount)
        self.followingCount = try container.decode(Int.self, forKey: .followingCount)
        self.profileBackgroundColor = try container.decode(String.self, forKey: .profileBackgroundColor)
        self.profileBackgroundImageUrl = try container.decode(String.self, forKey: .profileBackgroundImageUrl)
        self.profileImageUrl = try container.decode(String.self, forKey: .profileImageUrl)
        self.screenName = try container.decode(String.self, forKey: .screenName)
        
    }
}
