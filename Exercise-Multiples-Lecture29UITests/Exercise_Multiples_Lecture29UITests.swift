//
//  Exercise_Multiples_Lecture29UITests.swift
//  Exercise-Multiples-Lecture29UITests
//
//  Created by Felix Barros on 11/30/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import XCTest

class Exercise_Multiples_Lecture29UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDefaultState() {
        let app = XCUIApplication()
        let title = app.images["Multiples"]
        let result = app.staticTexts.elementBoundByIndex(0)
        let inputField = app.textFields.elementBoundByIndex(0)
        let playButton = app.buttons["Play"]
        
        XCTAssert(title.exists)
        XCTAssertEqual(result.label, "")
        XCTAssertEqual(inputField.label, "")
        XCTAssertEqual(inputField.placeholderValue, "Which number to display multiples for?")
        XCTAssert(playButton.exists)
    }
    
    func testUserEntersValue() {
        let app = XCUIApplication()
        let result = app.staticTexts.elementBoundByIndex(0)
        let playButton = app.buttons["Play"]
        
        enterMultiple(5)
        
        playButton.tap()
        XCTAssertEqual(result.label, "0 + 5 = 5")
        
        playButton.tap()
        XCTAssertEqual(result.label, "5 + 5 = 10")
        
        playButton.tap()
        XCTAssertEqual(result.label, "10 + 5 = 15")
        
        playButton.tap()
        XCTAssertEqual(result.label, "15 + 5 = 20")
    }
    
    func testUserChangesValue() {
        let app = XCUIApplication()
        let result = app.staticTexts.elementBoundByIndex(0)
        let playButton = app.buttons["Play"]
        
        enterMultiple(5)
        playButton.tap()
        XCTAssertEqual(result.label, "0 + 5 = 5")
        
        enterMultiple(5)
        playButton.tap()
        XCTAssertEqual(result.label, "5 + 5 = 10")
        
        enterMultiple(7)
        playButton.tap()
        XCTAssertEqual(result.label, "0 + 7 = 7")
        
        playButton.tap()
        XCTAssertEqual(result.label, "7 + 7 = 14")
        
    }
    
    func testReachesMaxNumber() {
        let app = XCUIApplication()
        let result = app.staticTexts.elementBoundByIndex(0)
        let playButton = app.buttons["Play"]
        
        let halfOfMaxNumber = Int.max/2
        enterMultiple(halfOfMaxNumber)
        playButton.tap()
        XCTAssertEqual(result.label, "0 + \(halfOfMaxNumber) = \(halfOfMaxNumber)")
        playButton.tap()
        XCTAssertEqual(result.label, "\(halfOfMaxNumber) + \(halfOfMaxNumber) = \(halfOfMaxNumber*2)")
        
        playButton.tap()
        XCTAssertEqual(result.label, "\(halfOfMaxNumber) + \(halfOfMaxNumber) = \(halfOfMaxNumber*2)")
    }
    
    // MARK: Helper functions
    func enterMultiple(multiple: Int) {
        let app = XCUIApplication()
        let background = app.otherElements.containingType(.TextField, identifier:"Which number to display multiples for?").childrenMatchingType(.Image).elementBoundByIndex(0)
        let inputField = app.textFields.elementBoundByIndex(0)
        
        inputField.tap()
        inputField.typeText("\(multiple)")
        background.tap()
   }
}
