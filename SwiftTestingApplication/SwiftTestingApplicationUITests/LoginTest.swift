//
//  LoginTest.swift
//  SwiftTestingApplicationUITests
//
//  Created by Stefan Stojanovski on 19/01/2021.
//  Copyright © 2021 Stefan Stojanovski. All rights reserved.
//


import XCTest

class LoginTest: XCTestCase {
    var app = XCUIApplication()
   
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
            continueAfterFailure = false
            UserDefaults.standard.removeObject(forKey: "isUserLoggedIn")
        
            app = XCUIApplication()
            app.launch()
        
      
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testLoginWithCredentials() {
        app.textFields["username_txt_login"].tap()
        app.textFields["username_txt_login"].typeText("lencetanaskoska@gmail.com")
        app.textFields["username_txt_login"].typeText("\n")
        
        app.secureTextFields["password_txt_login"].tap()
        app.secureTextFields["password_txt_login"].typeText("123QWEasd@")
        app.secureTextFields["password_txt_login"].typeText("\n")

        app.buttons["login_btn"].tap()
        XCTAssert(app.tables["books_table_view_main"].exists)

//        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "login_error_lbl").label, NSLocalizedString("email_error", comment: ""))
    }


}
