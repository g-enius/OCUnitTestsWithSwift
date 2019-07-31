//
//  DataSourceViewModel.swift
//  OCUnitTestsWithSwift
//
//  Created by Charles on 30/07/19.
//  Copyright © 2019 SKY. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import SwiftyJSON

struct DataSourceViewModel {
    //MARK: INPUT
    let provider: MoyaProvider<APIService>
    let mediaID: String

    //MARK: INIT
    init(apiProvider: MoyaProvider<APIService>, mediaID: String) {
        self.provider = apiProvider
        self.mediaID = mediaID
    }
    
    //MARK: OUTPUT
    var maskedURL: Single<String> {
        return provider.rx.request(.maskedURL(mediaID: mediaID))//Single<Response>
            .debug("maskedURL")
            .filter(statusCode: 200)
            .map { response in
                if let url = try JSON(data: response.data)["entries"][0]["media$content"][0]["plfile$url"].string,
                    !url.isEmpty {
                    return url
                } else {
                    throw APIServiceError.maskURLError
                }
            }
        
    
        
    }
}


//            .subscribe { event in
//                switch event {
//                case .success(let response):
//                    print(response.statusCode)
//                    print(response.data)
//
//                case .error(let error):
//                    print(error)
//                }
//        }
