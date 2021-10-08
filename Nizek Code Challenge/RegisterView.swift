//
//  RegisterView.swift
//  Nizek Code Challenge
//
//  Created by Hajir Javaheri on 7/10/1400 AP.
//

import SwiftUI
import CustomButton

struct RegisterView: View {
    @EnvironmentObject var authenticator: Authenticator
//    @EnvironmentObject var stopwatch: StopWatchManager
    @AppStorage("isNewUser") var isNewUser: Bool?
    @AppStorage("username") var savedUsername: String = ""
    @AppStorage("password") var savedPassword: String = ""
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            VStack(spacing: 25) {
                Group {
                    TextField("Username", text: $username)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    SecureField("Password", text: $password)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.title)
                .padding(30)
                .border(Color.black)
                .cornerRadius(3.0)
            }
            .padding()
            
            .padding(.bottom, 100)
            CustomButton(title: "Register") {
                guard !username.isEmpty || !password.isEmpty else {
                    return
                }
                savedUsername = username
                savedPassword = password
                isNewUser = false
                authenticator.start()
//                authenticator.needsAuthentication = false
//                stopwatch.start()
                print("start register")
            }
            .buttonStyle(CustomButtonStyle(
                            foregroundColor: .white,
                            backgroundColor: .green,
                            isDisabled: false))
            .disabled(isRegisterDisabled)
            ProgressView()
              .progressViewStyle(CircularProgressViewStyle())
              .opacity(authenticator.isAuthenticating ? 1.0 : 0.0)
        }
    }
    
    private var isRegisterDisabled: Bool {
      authenticator.isAuthenticating || username.isEmpty || password.isEmpty
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .environmentObject(Authenticator())
    }
}
