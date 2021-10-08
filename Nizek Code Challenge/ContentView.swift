//
//  ContentView.swift
//  Nizek Code Challenge
//
//  Created by Hajir Javaheri on 7/8/1400 AP.
//

import SwiftUI
import CustomButton
import UserNotifications


struct ContentView: View {
    @EnvironmentObject var authenticator: Authenticator
    @State private var notificationDate: Date = Date()
    
    var body: some View {
        VStack(spacing: 25.0) {
            CustomButton(title: "ButtonTitle") {}
                .buttonStyle(CustomButtonStyle(
                                foregroundColor: .red,
                                backgroundColor: .yellow,
                                isDisabled: false))
            
            CustomButton(title: "ButtonTitle", subTitle: "ButtonSubTitle") {}
                .buttonStyle(CustomButtonStyle(
                                foregroundColor: .white,
                                backgroundColor: .green,
                                isDisabled: false))
            
            CustomButton(title: "ButtonTitle", subTitle: "ButtonSubTitle", image: Image("flower")) {}
                .buttonStyle(CustomButtonStyle(foregroundColor: .black, backgroundColor: .white, isDisabled: false))
            
            CustomButton(title: "Log out")
                { authenticator.logout() }
                .buttonStyle(CustomButtonStyle(
                                foregroundColor: .white,
                                backgroundColor: .blue,
                                isDisabled: false))
                .padding(.top, 90)
        }
        .padding(25)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            print("Moving to the background!")
            notificationDate = Date()
            authenticator.stop()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            print("Moving back to the foreground!")
            let deltaTime: Int = Int(Date().timeIntervalSince(notificationDate))
            if deltaTime >= 10 {
                authenticator.logout()
            } else {
                authenticator.start()
                print("start from background")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Authenticator())
    }
}
