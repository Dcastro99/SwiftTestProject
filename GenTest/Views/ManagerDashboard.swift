//
//  ManagerDashboard.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//

import SwiftUI

struct ManagerDashboard: View {
    @AppStorage("token") var userToken: String?
    @AppStorage("Signed_in") var currentUserSignedIn: Bool = false
    @AppStorage("first_login") var firstLogin: Bool = false
    @EnvironmentObject var storedUser: UserObs
    var body: some View {
        VStack{
            Text("Manager Dash")
            HStack {
                Text("Wlecome ")
                Text(storedUser.user?.name ?? "no one")
                    .foregroundStyle(Color.red)
            }
            
            Button("logout") {
                userToken = nil
                currentUserSignedIn = false
                firstLogin = false
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            print("TM DASH NOW")
            
        }
    }
    
}

#Preview {
    ManagerDashboard()
}
