//
//  LoginView.swift
//  Nizek Code Challenge
//
//  Created by Hajir Javaheri on 7/10/1400 AP.
//

import SwiftUI
import CustomButton

struct LoginView: View {
    @EnvironmentObject var authenticator: Authenticator
    @State private var username: String = ""
    @State private var password: String = ""

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
            CustomButton(title: authenticator.isAuthenticating ? "Please wait" : "Log in") {
                authenticator.login(username: username, password: password)
            }
            .buttonStyle(CustomButtonStyle(
                            foregroundColor: .white,
                            backgroundColor: .green,
                            isDisabled: false))
            .disabled(isLoginDisabled)
            ProgressView()
              .progressViewStyle(CircularProgressViewStyle())
              .opacity(authenticator.isAuthenticating ? 1.0 : 0.0)
        }
    }
    
    private var isLoginDisabled: Bool {
      authenticator.isAuthenticating || username.isEmpty || password.isEmpty
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(Authenticator())
    }
}
