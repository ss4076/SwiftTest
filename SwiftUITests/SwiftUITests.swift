//
//  SwiftUITests.swift
//  SwiftUITests
//
//  Created by djpark on 2017. 10. 21..
//  Copyright © 2017년 djpark. All rights reserved.
//

import XCTest
@testable import SwiftTest

class SwiftUITests: XCTestCase {
//    var vc : ViewController!
    
    override func setUp() {
        super.setUp()
//        vc = ViewController()
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
    
    func testIncrease() {
//        let initialValue = vc.count;
//        vc.upBtnAction()
//        XCTAssertEqual(vc.count, initialValue+1)
    }
    
    func testDecrease() {
        
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["upbtn`"]
        button.tap()
        
        XCTAssertEqual(app.tables.cells.count, 1)

    }
    
}
