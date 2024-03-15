//
//  ErrorView.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//

import SwiftUI

struct ErrorView: View {
    @AppStorage("token") var userToken: String?
    @AppStorage("Signed_in") var currentUserSignedIn: Bool = false
    @AppStorage("first_login") var firstLogin: Bool = false
    var body: some View {
        Text("Role Type NOt found")
        Button("logout") {
            userToken = nil
            currentUserSignedIn = false
            firstLogin = false
        }
    }
}

#Preview {
    ErrorView()
}
