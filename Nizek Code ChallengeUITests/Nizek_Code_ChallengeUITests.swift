//
//  Nizek_Code_ChallengeUITests.swift
//  Nizek Code ChallengeUITests
//
//  Created by Hajir Javaheri on 7/17/1400 AP.
//

import XCTest
import SwiftUI

class Nizek_Code_ChallengeUITests: XCTestCase {
    @AppStorage("isNewUser") var isNewUser: Bool?
    @AppStorage("username") var savedUsername: String?
    @AppStorage("password") var savedPassword: String?

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLogin() throws {
        guard let isNewUser = isNewUser, !isNewUser  else {
            return
        }
        guard let savedUsername = savedUsername,
              let savedPassword = savedPassword else {
            return
        }
        let app = XCUIApplication()
        app.launch()

        var usernameField = app.textFields["username"]
        let passwordField = app.textFields["password"]
        let registerButton = app.buttons["loginButton"]
        usernameField.typeText(savedUsername)
        passwordField.typeText(savedPassword)
        registerButton.tap()
        
        let greetingText = app.staticTexts["greeting"]
        XCTAssertEqual(greetingText.label, "Hello hazhir")
    }
}
