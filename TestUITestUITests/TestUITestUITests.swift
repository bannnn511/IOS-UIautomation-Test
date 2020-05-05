//
//  TestUITestUITests.swift
//  TestUITestUITests
//
//  Created by Mac on 3/12/20.
//  Copyright © 2020 Khai Tran. All rights reserved.
//

import XCTest

class TestUITestUITests: XCTestCase {
    let app = XCUIApplication()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
        let usernameTf = app.textFields.element(boundBy: 0)
        usernameTf.tap()
        usernameTf.typeText("Khai2504")
        
        let passTf = app.textFields.element(boundBy: 1)
        passTf.tap()
        passTf.typeText("123")
        
        app.buttons["LogIn"].tap()
        
        let homeView = app.otherElements["HomeVC"]
        XCTAssertTrue(homeView.exists)
        
    }
    
    func runCorrectInput() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let usernameTf = app.textFields.element(boundBy: 0)
        usernameTf.tap()
        usernameTf.typeText("Khai2504")
        
        let passTf = app.textFields.element(boundBy: 1)
        passTf.tap()
        passTf.typeText("123")
        
        app.buttons["LogIn"].tap()
        
        //           let homeView = app.otherElements["HomeVC"]
        //           XCTAssertTrue(homeView.exists)
        
    }
    
    func testEmptyInput() {
        app.buttons["LogIn"].tap()
        
        let alert = app.alerts["Error"]
        
        XCTAssertTrue(alert.exists)
        
        alert.buttons["OK"].tap()
        
    }
    
    func testEmptyPass() {
        
        
        let usernameTf = app.textFields.element(boundBy: 0)
        usernameTf.tap()
        usernameTf.typeText("Khai2504")
        app.buttons["LogIn"].tap()
        
        let alert = app.alerts["Error"]
        
        XCTAssertTrue(alert.exists)
        
        alert.buttons["OK"].tap()
        
    }
    
    func testEmptyUserName() {
        
        
        let usernameTf = app.textFields.element(boundBy: 1)
        usernameTf.tap()
        usernameTf.typeText("123")
        app.buttons["LogIn"].tap()
        
        let alert = app.alerts["Error"]
        
        XCTAssertTrue(alert.exists)
        
        alert.buttons["OK"].tap()
        
    }
    
    func testWrongUserName() {
        
        
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
    
    func testAdjustingASlider() {
        
        let usernameTf = app.textFields.element(boundBy: 0)
        usernameTf.tap()
        usernameTf.typeText("Khai2504")
        
        let passTf = app.textFields.element(boundBy: 1)
        passTf.tap()
        passTf.typeText("123")
        
        app.buttons["LogIn"].tap()
        app.staticTexts["Manage Team"].tap()
        
        app.sliders.element.adjust(toNormalizedSliderPosition: 0.7)
        XCTAssert(app.staticTexts["7"].exists)
    }
    
    func testTextExistsInAWebView() {
        
        runCorrectInput()
        app.buttons["More info"].tap()
        let volleyballLabel = app.staticTexts["Volleyball"]
        XCTAssert(volleyballLabel.waitForExistence(timeout: 5))
    }
    
    func testTappingALinkInAWebView() {
        
        runCorrectInput()
        app.buttons["More info"].tap()
        
        let disambiguationLink = app.links["Volleyball (disambiguation)"]
        XCTAssert(disambiguationLink.waitForExistence(timeout: 5))
        
        disambiguationLink.tap()
        
        let volleyballLink = app.links["Volleyball (ball)"]
        XCTAssert(volleyballLink.waitForExistence(timeout: 5))
    }
    
    func testPushingAController() {
        runCorrectInput()
        app.buttons["More info"].tap()
        XCTAssert(app.navigationBars["Volleyball?"].exists)
    }
    
    func testPoppingAViewController() {
        runCorrectInput()
        app.buttons["More info"].tap()
        XCTAssert(app.navigationBars["Volleyball?"].exists)
        app.navigationBars.buttons.element(boundBy: 0).tap()
        XCTAssert(app.navigationBars["Test"].exists)
    }
    
    func testWaitingForAnElementToAppear() {
        runCorrectInput()
        app.staticTexts["View Schedule"].tap()
        //app.scrollViews.element.swipeUp()
        XCTAssertFalse(app.buttons["Load More Games"].isHittable)
//        app.buttons["Load More Games"].tap()
//
//        let nextGameLabel = self.app.staticTexts["Game 4 - Tomorrow"]
//        XCTAssert(nextGameLabel.waitForExistence(timeout: 5))
    }
    
    func testScrollWaitingForAnElementToAppear() {
        runCorrectInput()
      
        app/*@START_MENU_TOKEN@*/.tables.staticTexts["View Schedule"]/*[[".otherElements[\"HomeVC\"].tables",".cells.staticTexts[\"View Schedule\"]",".staticTexts[\"View Schedule\"]",".tables"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
        app.scrollViews.element.swipeUp()
        app.scrollViews.otherElements/*@START_MENU_TOKEN@*/.staticTexts["Load More Games"]/*[[".buttons[\"Load More Games\"].staticTexts[\"Load More Games\"]",".staticTexts[\"Load More Games\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
         app.buttons["Load More Games"].tap()
        
        let nextGameLabel = self.app.staticTexts["Game 4 - Tomorrow"]
        XCTAssert(nextGameLabel.waitForExistence(timeout: 5))
        
    }
    
    func testDismissingAnAlert() {
        runCorrectInput()
        app.staticTexts["View Schedule"].tap()
        
        XCTAssertTrue(app.buttons["Finish Game"].isHittable)
        app.buttons["Finish Game"].tap()
        app.alerts["You won!"].buttons["Awesome!"].tap()
    }
    
    func testAdjustingAPicker() {
        runCorrectInput()
        app.staticTexts["Manage Team"].tap()
        
        let selectedFormationLabel = app.staticTexts["5 attackers, 1 setter"]
        XCTAssertFalse(selectedFormationLabel.exists)
        
        let attackersPredicate = NSPredicate(format: "label BEGINSWITH 'Attackers Formation'")
        let attackersPicker = app.pickerWheels.element(matching: attackersPredicate)
        attackersPicker.adjust(toPickerWheelValue: "5 attackers")
        
        let settersPredicate = NSPredicate(format: "label BEGINSWITH 'Setters Formation'")
        let settersPicker = app.pickerWheels.element(matching: settersPredicate)
        settersPicker.adjust(toPickerWheelValue: "1 setter")
        
        XCTAssert(selectedFormationLabel.exists)
    }
    
    func testTypingText() {
        runCorrectInput()
        app.staticTexts["Manage Team"].tap()
        
        let textField = app.textFields["Team Name"]
        textField.tap()
        textField.typeText("Dig Newtons")
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
