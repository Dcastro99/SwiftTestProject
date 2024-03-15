//
//  SelectBranch.swift
//  GenTest
//
//  Created by Danny Castro on 3/7/24.
//

import SwiftUI

struct SelectBranch: View {
    @EnvironmentObject var storedUser: UserObs
    @State private var selectedBranch: Branch?
    var body: some View {
        VStack {
            Text("Selected Branch: \(selectedBranch?.branch ?? "None")")
                .foregroundStyle(Color.primary)
            
            BranchListView(selectedBranch: $selectedBranch)
//            
                .onChange(of: selectedBranch) { oldValue, newValue in
                    if let branchId = newValue?.id {
                        storedUser.updateBranchId(branchId: branchId)
//                        print(storedUser.user)
                    }
                }
           
        }
        
    }
}

#Preview {
    Pickers()
}


struct BranchListView: View {
    @EnvironmentObject var storedUser: UserObs
    @Binding var selectedBranch: Branch?
    
    var body: some View {
        List(branches.filter { branch in
            guard let branchIds = storedUser.user?.branch_ids as? [Int] else {
                return false
            }
            return branchIds.contains(branch.id)
        }, id: \.id) { branch in
            Button(action: {
                selectedBranch = branch
            }) {
                Text(branch.branch)
                    .foregroundStyle(.primary)
            }
        }
    }
}

#Preview {
    SelectBranch()
}
