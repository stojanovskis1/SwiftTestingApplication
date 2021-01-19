//
//  LoginTests.swift
//  SwiftTestingApplicationTests
//
//  Created by Stefan Stojanovski on 19/01/2021.
//  Copyright © 2021 Stefan Stojanovski. All rights reserved.
//

import XCTest

class LoginErrorTests: XCTestCase {
    var app = XCUIApplication()
   
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
            continueAfterFailure = false
        UserDefaults.standard.removeObject(forKey: "isUserLoggedIn")
            app = XCUIApplication()
            app.launchArguments = ["-StartFromCleanState", "YES"]
            app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginWithWrongPasswordCredentials() {

        app.textFields["username_txt_login"].tap()
        app.textFields["username_txt_login"].typeText("lencetanaskoska@gmail.com")
        app.textFields["username_txt_login"].typeText("\n")
        
        app.secureTextFields["password_txt_login"].tap()
        app.secureTextFields["password_txt_login"].typeText("test")
        app.secureTextFields["password_txt_login"].typeText("\n")

        app.buttons["login_btn"].tap()
        
        let error:String = XCUIApplication().staticTexts.element(matching:.any, identifier: "login_error_lbl").label
        let correctError: String = "Your password must contain at least 8 letters, upercase letter, lowecase letter and number"
        
//        let assert = (error == correctError)
        
        XCTAssert(!error.isEmpty)
    }
    
    func testLoginWithWrongUsernameCredentials() {
        app.textFields["username_txt_login"].tap()
        app.textFields["username_txt_login"].typeText("lencetanaskoskagmail.com")
        app.textFields["username_txt_login"].typeText("\n")
        
        app.secureTextFields["password_txt_login"].tap()
        app.secureTextFields["password_txt_login"].typeText("123QWEasd@")
        app.secureTextFields["password_txt_login"].typeText("\n")

        app.buttons["login_btn"].tap()
        XCTAssert(!app.staticTexts.element(matching:.any, identifier: "login_error_lbl").label.isEmpty)

//        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "login_error_lbl").label, NSLocalizedString("email_error", comment: ""))
    }
//
//
    func testLoginWithWrongCredentials() {
        app.textFields["username_txt_login"].tap()
        app.textFields["username_txt_login"].typeText("")
        app.textFields["username_txt_login"].typeText("\n")
        
        app.secureTextFields["password_txt_login"].tap()
        app.secureTextFields["password_txt_login"].typeText("")
        app.secureTextFields["password_txt_login"].typeText("\n")
        app.buttons["login_btn"].tap()

        XCTAssert(!app.staticTexts.element(matching:.any, identifier: "login_error_lbl").label.isEmpty)
//        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "login_error_lbl").label, NSLocalizedString("email_error", comment: ""))
    }
    



}
