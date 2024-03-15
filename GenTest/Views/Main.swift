//
//  Main.swift
//  GenTest
//
//  Created by Danny Castro on 3/5/24.
//

import SwiftUI



struct Main: View {
    @StateObject var storeUser = UserObs(data: nil)
    @StateObject var storedTickets = BranchTickets(data: nil)

    var body: some View {
        
        VStack{
            LoginPage()
        }
        .environmentObject(storeUser)
        .environmentObject(storedTickets)

    }
}

#Preview {
    Main()
}
