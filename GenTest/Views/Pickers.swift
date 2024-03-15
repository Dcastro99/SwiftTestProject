//
//  Pickers.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//

import SwiftUI

struct Pickers: View {
    @State private var selectedBranch: Branch?
    var body: some View {
        VStack {
            Text("Selected Branch: \(selectedBranch?.branch ?? "None")")
                .foregroundStyle(Color.primary)
               
            BranchListView(selectedBranch: $selectedBranch)
        }
        
    }
}

#Preview {
    Pickers()
}

//
//struct BranchListView: View {
//    @Binding var selectedBranch: Branch?
//    
//    var body: some View {
//        List(branches, id: \.id) { branch in
//            Button(action: {
//                selectedBranch = branch
//            }) {
//                Text(branch.branch)
//                    .foregroundStyle(.primary)
//            }
//        }
//    }
//}
