//
//  Page4Sect2.swift
//  GenTest
//
//  Created by Danny Castro on 3/29/24.
//

import SwiftUI

struct Page4Sect2: View {
    @Binding var branchChecklistPage4Model: BranchChecklistPage4Model
    
    let placeholder = "Comments..."
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Divider2()
                
                Text("Flammable & Combustible Materials")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.properStorage)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Proper storage methods used to minimize risk of fire")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.safePracticeWithLiquidGas)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Safe practices followed when liquid petroleum (LP) gas is stored, handled, and used")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.liquidGasTanksGuarded)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Liquid petroleum (LP) storage tanks guarded to prevent damage")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.noSmokingSigns)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("\"NO SMOKING\" signs posted in areas where flammable materials are stored")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage4Model.page4sec2Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage4Model.page4sec2Comments)
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

