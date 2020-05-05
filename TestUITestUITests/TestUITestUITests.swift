//
//  TestUITestUITests.swift
//  TestUITestUITests
//
//  Created by Mac on 3/12/20.
//  Copyright © 2020 Khai Tran. All rights reserved.
//

import XCTest

class TestUITestUITests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCorrectInput() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        let usernameTf = app.textFields.element(boundBy: 0)
        usernameTf.tap()
        usernameTf.typeText("Khai2504")
        
        let passTf = app.textFields.element(boundBy: 1)
        passTf.tap()
        passTf.typeText("123")
        
        app.buttons["LogIn"].tap()
        
        let homeView = app.otherElements["homeVC"]
        XCTAssertTrue(homeView.exists)
    
    }
    
    func testEmptyInput() {
        let app = XCUIApplication()
        app.buttons["LogIn"].tap()
        
        let alert = app.alerts["Error"]
        
        XCTAssertTrue(alert.exists)
        
        alert.buttons["OK"].tap()
        
    }
    
    func testEmptyPass() {
        let app = XCUIApplication()
        
        let usernameTf = app.textFields.element(boundBy: 0)
        usernameTf.tap()
        usernameTf.typeText("Khai2504")
        app.buttons["LogIn"].tap()
        
        let alert = app.alerts["Error"]
        
        XCTAssertTrue(alert.exists)
        
        alert.buttons["OK"].tap()
            
    }
    
    func testEmptyUserName() {
        let app = XCUIApplication()
        
        let usernameTf = app.textFields.element(boundBy: 1)
        usernameTf.tap()
        usernameTf.typeText("123")
        app.buttons["LogIn"].tap()
        
        let alert = app.alerts["Error"]
        
        XCTAssertTrue(alert.exists)
        
        alert.buttons["OK"].tap()
            
    }
    
    func testWrongUserName() {
        let app = XCUIApplication()
        
        let usernameTf = app.textFields.element(boundBy: 0)
        usernameTf.tap()
        usernameTf.typeText("khaikhaikhai123456")
        
        let passTf = app.textFields.element(boundBy: 1)
        passTf.tap()
        passTf.typeText("123")
        
        app.buttons["LogIn"].tap()
        
        let alert = app.alerts["Error"]
        
        XCTAssertTrue(alert.exists)
        
        alert.buttons["OK"].tap()
    }
    
    func testTableView() {
        testCorrectInput()
        let app = XCUIApplication()
        app.tables.staticTexts["101"].tap()
        app.tables.staticTexts["104"].swipeUp()
        app.tables.staticTexts["105"].swipeRight()
        
        let table = app.otherElements["homeVC"].children(matching: .table).element
        table.swipeRight()
        table.swipeLeft()
        app.tables.staticTexts["102"].swipeDown()
        
    }
    
    func testSameTf() {
        
        let app = XCUIApplication()
    
        let usernameTextField = app.children(matching: .textField).matching(identifier: "UserName").element(boundBy: 1)
        usernameTextField.tap()
        usernameTextField.typeText("Khai2504")

        let usernameTextField2 = app.children(matching: .textField).matching(identifier: "UserName").element(boundBy: 0)
        usernameTextField2.tap()
        app.textFields["Password"].tap()
        usernameTextField2.tap()
        usernameTextField.tap()
                        
    }

//    func testLaunchPerformance() {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
