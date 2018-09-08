//
//  TwitterMoyaRouter.swift
//  mood-reading-machines
//
//  Created by Aline Borges on 08/09/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import Moya

struct NetworkingConstants {
    
    private init() {}
    
    struct Twitter {
        static let apiKey = getEnvironmentVar("twitter_public_key")
        static let privateKey = getEnvironmentVar("twitter_private_key")
        static let baseURL = "https://api.twitter.com"
    }
}

enum TwitterMoyaRouter {
    case authenticate
    case getUser(displayName: String)
    case getTweets(displayName: String)
}

extension TwitterMoyaRouter: TargetType {
    
    var baseURL: URL {
        return URL(string: NetworkingConstants.Twitter.baseURL)!
    }
    
    var path: String {
        switch self {
        case .authenticate:
            return "/oauth2/token"
        case .getUser:
            return "/1.1/users/show.json"
        case .getTweets:
            return "/1.1/statuses/user_timeline.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .authenticate:
            return .post
        case .getUser, .getTweets:
            return .get
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .authenticate:
            return ["grant_type": "client_credentials"]
        case .getUser(let displayName):
            return ["screen_name": displayName]
        case .getTweets(let displayName):
            return ["screen_name": displayName]
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        if let `parameters` = parameters {
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        } else {
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .authenticate:
            let basicAuthToken = "\(NetworkingConstants.Twitter.apiKey):\(NetworkingConstants.Twitter.privateKey)"
                .data(using: .utf8)
            let encoded = basicAuthToken?.base64EncodedString() ?? ""
            return [
                "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8",
                "Authorization": "Basic \(encoded)"
            ]
        default:
            let storage = UserDefaultsStorage()
            guard let token = storage.accessToken else { fatalError("Please authenticate first") }
            return [
                "Content-type": "application/json",
                "Authorization": "Bearer \(token)"
            ]
        }
    }
    
}
