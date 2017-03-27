//
//  YNDropDownMenuUITests.swift
//  YNDropDownMenuUITests
//
//  Created by YiSeungyoun on 2017. 3. 28..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//


import XCTest

class YNDropDownMenuUITests: XCTestCase {
    
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
    
    func testExample() {
        
        let app = XCUIApplication()
        let img2279PngElementsQuery = app.otherElements.containing(.image, identifier:"IMG_2279.PNG")
        let element = img2279PngElementsQuery.children(matching: .other).element
        element.children(matching: .button).element(boundBy: 0).tap()
        
        let element2 = img2279PngElementsQuery.children(matching: .other).element(boundBy: 0)
        element2.children(matching: .button).element(boundBy: 1).tap()
        element2.children(matching: .button).element(boundBy: 2).tap()
        app.buttons["Cancel"].tap()
        element.children(matching: .button).element(boundBy: 1).tap()
        element2.children(matching: .button).element(boundBy: 3).tap()
        app.buttons["Ok"].tap()
        
    }
    
}
