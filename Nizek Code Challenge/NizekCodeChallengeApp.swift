//
//  Nizek_Code_ChallengeApp.swift
//  Nizek Code Challenge
//
//  Created by Hajir Javaheri on 7/8/1400 AP.
//

import SwiftUI

@main
struct NizekCodeChallengeApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @AppStorage("isNewUser") var isNewUser: Bool = true
    @StateObject var authenticator = Authenticator()
    
    var body: some Scene {
        WindowGroup {
            if isNewUser {
                RegisterView()
                    .environmentObject(authenticator)
            } else {
                RootView()
                    .environmentObject(authenticator)
            }
        }
    }
}
