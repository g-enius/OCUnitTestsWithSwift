//
//  SkyConradTests.swift
//  SkyConradTests
//
//  Created by Charles on 13/08/18.
//  Copyright © 2018 Sky TV. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
import Nimble
import RxNimble
import OHHTTPStubs
import Moya

@testable import OCUnitTestsWithSwift

class APIServiceTests: XCTestCase {
    var dataSourceViewModel: DataSourceViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()

        dataSourceViewModel = DataSourceViewModel(apiProvider: MoyaProvider<APIService>(),
                                                  mediaID: "1561120323747")
        
//        stub(condition: isHost("feed.theplatform.com")) { _ in
//            // Stub it with our "MaskedURLMock.json" stub file (which is in same bundle as self)
//            let stubPath = OHPathForFile("MaskedURLMock.json", type(of: self))
//            return fixture(filePath: stubPath!, headers: ["Content-Type":"application/json"])
//        }
//
        stub(condition: isHost("error.com")) { _ in
          return OHHTTPStubsResponse(error: APIServiceError.unknown)
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        OHHTTPStubs.removeAllStubs()
    }
    
    func testMaskedURL() { expect(self.dataSourceViewModel.maskedURL.toBlocking().firstOrNil()).to(contain("https://link.theplatform.com"))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

extension BlockingObservable {
    func firstOrNil() -> Element? {
        do {
            return try first()
        } catch {
            return nil
        }
    }
}
