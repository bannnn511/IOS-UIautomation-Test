//
//  TestUITestTests.swift
//  TestUITestTests
//
//  Created by Mac on 3/12/20.
//  Copyright © 2020 Khai Tran. All rights reserved.
//

import XCTest
@testable import TestUITest

class TestUITestTests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testWithEmptyInput() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
