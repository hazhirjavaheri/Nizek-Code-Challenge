//
//  RootView.swift
//  Nizek Code Challenge
//
//  Created by Hajir Javaheri on 7/11/1400 AP.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var authenticator: Authenticator

  var body: some View {
    ContentView()
      .fullScreenCover(isPresented: $authenticator.needsAuthentication) {
        LoginView()
            .environmentObject(authenticator)
      }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
      .environmentObject(Authenticator())
  }
}

