//
//  Page4Sect3.swift
//  GenTest
//
//  Created by Danny Castro on 3/29/24.
//

import SwiftUI

struct Page4Sect3: View {
    @Binding var branchChecklistPage4Model: BranchChecklistPage4Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Divider2()
                
                Text("Personal Protective Equipment (PPE)")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.ppeInspectedDaily)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("PPE inspected daily for damage and wear (gloves, harnesses, lanyards, etc.)")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.glovesWorn)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Gloves worn at all times when handlings product or operating MHE")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.gogglesWorn)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Protective goggles or face shields provided and worn when there is any danger of flying materials")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.earProtectionWorn)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Ear protection is provided and used in areas where it is necessary to raise your voice to be heard")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage4Model.page4sec3Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage4Model.page4sec3Comments)
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

