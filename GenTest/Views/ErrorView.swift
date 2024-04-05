//
//  ErrorView.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//

import SwiftUI

struct ErrorView: View {

    var body: some View {
        VStack{
            Text("Role Type NOt found")
            Button(action: {
                UserSession.signOut()
            }, label: {
                Text("Logout")
                    .font(.title)
            })
        }
    }
}

#Preview {
    ErrorView()
}
