//
//  SkyConradTests.swift
//  SkyConradTests
//
//  Created by Charles on 13/08/18.
//  Copyright © 2018 Sky TV. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import RxBlocking


@testable import OCUnitTestsWithSwift

class APIServiceTests: XCTestCase {
    
    let disposeBag = DisposeBag()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        let vm = DataSourceViewModel()
        
        let emitted = try! vm.maskURL
                        .toBlocking(timeout: 100)
                        .first()
        print(emitted)
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
