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
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLogin() throws {
        guard let isNewUser = isNewUser, !isNewUser  else {
            return
        }
        let app = XCUIApplication()
        app.launch()

        var usernameField = app.textFields["username"]
        let passwordField = app.textFields["password"]
        let registerButton = app.buttons["loginButton"]
        usernameField.typeText("hazhir")
        passwordField.typeText("1234")
        registerButton.tap()
        
        let greetingText = app.staticTexts["greeting"]
        XCTAssertEqual(greetingText.label, "Hello hazhir")
    }
}
