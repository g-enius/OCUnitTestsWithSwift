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

struct DataSourceViewModel {
    var disposeBag = DisposeBag()
    
    var maskURL: Single<String> {
        let provider = MoyaProvider<APIService>()
        return provider.rx.request(.maskedURL(mediaID: "1561120323747"))//Single<Response>
        .debug("ssss")
//            .filter(statusCode: 200)
            .mapString()   
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
