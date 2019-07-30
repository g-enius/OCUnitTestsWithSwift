//
//  APIService.swift
//  SkyConrad
//
//  Created by Charles on 29/07/19.
//  Copyright © 2019 Sky TV. All rights reserved.
//

import Foundation
import Moya

enum APIService {
    case maskedURL(mediaID: String)
    case currencyLock
    
}

enum APIServiceError: Error {
    case maskURLError
    case unknown
}

extension APIService: TargetType {
    var baseURL: URL { return URL(string: "https://feed.theplatform.com")! }
    var path: String {
        switch self {
        case .maskedURL:
            return "/f/7tMqSC/T2XJ65T_soBz/"
            
        case .currencyLock:
            return ""
            
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .maskedURL:
            return .get
            
        case .currencyLock:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .maskedURL(let mediaID):
            let dic = ["form": "json",
                       "types": "none",
                       "httpError": "false",
                       "fields": "id,content",
                       "validFeed": "false",
                       "byContent": "byFormat=m3u",
                       "byId": mediaID,
                       "range": "1-10",
                       "fileFields": "format,url"]
            return .requestParameters(parameters: dic, encoding: URLEncoding.default)
            
        case .currencyLock:
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        switch self {
        case .maskedURL:
            return "Half measures are as bad as nothing at all.".utf8Encoded
            
        case .currencyLock:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
}

// MARK: - Helpers
private extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
