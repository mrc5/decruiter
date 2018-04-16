//
//  decruiterUITests.swift
//  decruiterUITests
//
//  Created by Marcus on 16.03.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import XCTest

class decruiterUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.

        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_decruiter() {
        snapshot("MainScreen01")
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Herr"]/*[[".cells.buttons[\"Herr\"]",".buttons[\"Herr\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Name"]/*[[".cells.textFields[\"Name\"]",".textFields[\"Name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["M"]/*[[".keyboards.keys[\"M\"]",".keys[\"M\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.keys["u"].tap()
        app.keys["s"].tap()
        app.keys["t"].tap()
        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        app.keys["e"].tap()
        app.keys["r"].tap()
        app.keys["m"].tap()
        app.keys["a"].tap()
        let nKey = app.keys["n"]
        nKey.tap()
        nKey.tap()
        
        let rKey = app/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        rKey.tap()
        
        let returnButton = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards.buttons[\"Return\"]",".buttons[\"Return\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Danke"]/*[[".cells.buttons[\"Danke\"]",".buttons[\"Danke\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Nicht im Moment"]/*[[".cells.buttons[\"Nicht im Moment\"]",".buttons[\"Nicht im Moment\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["K Thx bye"]/*[[".cells.buttons[\"K Thx bye\"]",".buttons[\"K Thx bye\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Dein Name"]/*[[".cells.textFields[\"Dein Name\"]",".textFields[\"Dein Name\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["J"]/*[[".keyboards.keys[\"J\"]",".keys[\"J\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        eKey.tap()
        nKey.tap()
        app/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        returnButton.tap()
        
        snapshot("MainScreen02")
        
        let textView = tablesQuery.children(matching: .cell).element(boundBy: 0).children(matching: .textView).element
        textView.swipeUp()

        app.buttons["📥 kopieren"].tap()
        app.navigationBars["decruiter"].buttons["Refresh"].tap()
        XCUIDevice.shared.orientation = .faceUp
    }
    
}
