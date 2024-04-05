//
//  Page4Sect4.swift
//  GenTest
//
//  Created by Danny Castro on 3/29/24.
//

import SwiftUI

struct Page4Sect4: View {
    @Binding var branchChecklistPage4Model: BranchChecklistPage4Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Divider2()
                Text("Hand Tools & Equipment")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.tmTrained)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Team Members have been trained on how to use all tools provided")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.safeGuardTaken)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("All safe guards are utilized")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.brokenToolsReplaced)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Broken hand tools and power tools are discarded and replaced promptly")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage4Model.page4sec4Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage4Model.page4sec4Comments)
                        .frame(height: 75)
                    
                    
                }
                .scrollContentBackground(.hidden)
                .background(.ultraThinMaterial)
                .padding(.horizontal, 30)
                .padding(.top, 20)
            }//MAIN VSTACK
            .padding()
        }
    }
}

