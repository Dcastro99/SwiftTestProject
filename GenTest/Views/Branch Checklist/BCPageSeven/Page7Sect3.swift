//
//  Page7Sect3.swift
//  GenTest
//
//  Created by Danny Castro on 4/3/24.
//

import SwiftUI

struct Page7Sect3: View {
    @Binding var branchChecklistPage7Model: BranchChecklistPage7Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                Divider2()
                
                Text("Housekeeping - Warehouse")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment:.leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.workstationClean)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Workstations are kept clean and organized")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.noEmptyPallets)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Empty pallets are not left in stocking locations")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.cleanfloors)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Floors are clear of debris")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage7Model.page7sec3Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage7Model.page7sec3Comments)
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

