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

extension APIService: TargetType {
    var baseURL: URL { return URL(string: "https://feed.theplatform.com")! }
    var path: String {
        switch self {
        case .maskedURL(let mediaID):
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
        case .maskedURL(let mediaID):
            return "Half measures are as bad as nothing at all.".utf8Encoded
            
        case .currencyLock:
            return "Half measures are as bad as nothing at all.".utf8Encoded
        }
    }
    
    var headers: [String : String]? {
        return [:]
//                "Content-Type": "application/json"
//                "X-Sky-API-Key": "328CB85490B54DC95FD5209A424974C5",
//                "Accept": "application/json"
//                "User-Agent": "skygo-iphone (ver=1.2.4.3 Build 494 dev=2AB29A61-6192-4D0F-AE63-5194FB683470)",
//                "x-api-key": "0VLwN2X1Nk99ao12C5byc7fn59iHxatD9SUQye69",
//                "Sky-X-Forwarded-for": "172.24.185.115",
//                "Accept-Encoding": "br, gzip, deflate",
//                "ADRUM_1": "isMobile:true",
//                "ADRUM": "isAjax:true",
//                "Connection": "keep-alive",
//                "Accept-Language": "en-US;q=1, zh-Hans-US;q=0.9"
//                "Sky-X-Access-Token": "eyJhbGciOiJIUzI1NiJ9.eyJFTkMiOiJRWlVhUmd2K2h5dXNqSUtKVk9ZN3BqbGNENHJEUG1LZmlPYVlwbjVKRUo1OXhCQk5WU25pVEZEZkxqSFZ0NUhJIiwiUGFydG5lciI6InNreWdvIiwiRGV2aWNlIjoiMkFCMjlBNjEtNjE5Mi00RDBGLUFFNjMtNTE5NEZCNjgzNDcwIiwiRGV2aWNlSVAiOiIxNzIuMjQuMTg1LjExNSIsIkFjY291bnRJZCI6IjI4MjY0NjEwNyIsInN1YiI6IlM3b05BKzhUS21ySUg1eWdqWFpGOE54OTRCN0NGenZ3MDF1bnBwTVlYa0E9IiwiZXhwIjoxNTY0NDUzOTg2LCJpc3MiOiJTa3lBdXRoIn0.lQEF9AkaD2RkdhNZpIbCxzd8BqFS2QTnSAwO-PYicdM"
//            ]
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
