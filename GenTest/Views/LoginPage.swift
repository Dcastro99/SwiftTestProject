//
//  LoginPage.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//

import SwiftUI

struct LoginPage: View {
    @State private var user: GetUserModel?
    @State private var tickets: [GetTicketModel]?
    @EnvironmentObject var storedUser: UserObs
    @EnvironmentObject var storedTickets: BranchTickets
    @AppStorage("token") var userToken: String?
    @AppStorage("Signed_in") var currentUserSignedIn: Bool = false
    private var mainBgColor = #colorLiteral(red: 0.8131273912, green: 0.7377171282, blue: 0.578667129, alpha: 0.3209592301)
    var body: some View {
        NavigationStack{
            ZStack {
                Color(mainBgColor).ignoresSafeArea(.all)
                if currentUserSignedIn {
                    
                    destinationView()
                } else {
                    LoginScreen()
                }
            }
            .onAppear{
                print("in login Page")
                if (userToken != nil) {
                    print("user token exists")
                    Task {
                        do {
                            user = try await GetUser(token: userToken, storeUser: storedUser)
//                            print("user in login \(String(describing: user))")
                        }
                    }
                }
            }
            .refreshable {
                await refreshData()
            }
            
        }
    }
    func refreshData() async {
        print("Refresh triggered")
        Task {
            do {
                tickets = try await  GetBranchTickets(token: userToken, id: storedUser.user?.branchId ?? 99, storedTickets: storedTickets)
            }
        }
    }
    
    @ViewBuilder
    private func destinationView() -> some View {
          switch storedUser.user?.role {
          case 1: AdminDashboard()
            case 2: OperationDashboard()
            case 3: ManagerDashboard()
          case 4: TMDashboard()
            case 5: TMDashboard()
            default: ErrorView()
            }
    }
}

#Preview {
    LoginPage()
}
