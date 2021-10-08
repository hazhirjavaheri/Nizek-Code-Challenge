//
//  Authenticator.swift
//  Nizek Code Challenge
//
//  Created by Hajir Javaheri on 7/11/1400 AP.
//

import SwiftUI

class Authenticator: ObservableObject {
    @AppStorage("isNewUser") var isNewUser: Bool?
    @AppStorage("username") var savedUsername: String?
    @AppStorage("password") var savedPassword: String?
    @Published var needsAuthentication: Bool
    @Published var isAuthenticating: Bool
    var timer: Timer = Timer()

//    @EnvironmentObject var stopwatch: StopWatchManager

    init() {
        self.needsAuthentication = true
        self.isAuthenticating = false
    }
    
    func login(username: String, password: String) {
        guard let savedUsername = savedUsername,
              let savedPassword = savedPassword  else {
            return
        }
        self.isAuthenticating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if username == savedUsername, password == savedPassword {
                self.start()
                print("start login")
            }
            self.isAuthenticating = false
        }
    }
    
    func logout() {
        self.needsAuthentication = true
        self.stop()
    }
    
    func start() {
        self.needsAuthentication = false
        timer = Timer.scheduledTimer(withTimeInterval: 30, repeats: false) { _ in
            self.logout()
        }
    }

    func stop() {
        timer.invalidate()
    }
}
