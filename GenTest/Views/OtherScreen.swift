//
//  OtherScreen.swift
//  GenTest
//
//  Created by Danny Castro on 3/5/24.
//

import SwiftUI

struct OtherScreen: View {
    @AppStorage("token") var userToken: String?
    @AppStorage("Signed_in") var currentUserSignedIn: Bool = false
    @EnvironmentObject var storedUser: UserObs
    var body: some View {
        VStack{
            Text("Logged in")
            Button(action: {
                userToken = nil
                currentUserSignedIn = false
            }, label: {
                Text("Logout")
            })
        }
//        .onAppear{
//            print("USER in OtherScreen: \(String(describing: storedUser.user))")
//        }
//        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OtherScreen()
}
