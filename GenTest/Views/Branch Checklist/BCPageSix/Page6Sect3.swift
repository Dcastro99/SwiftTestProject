//
//  Page6Sect3.swift
//  GenTest
//
//  Created by Danny Castro on 4/2/24.
//

import SwiftUI

struct Page6Sect3: View {
    @Binding var branchChecklistPage6Model: BranchChecklistPage6Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                Divider2()
                
                Text("Housekeeping - Showroom")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment:.leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.shelvesOrganized)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Product on shelves are clean and organized")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.isrStationsClean)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("ISR stations and back counter are clean and organized")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.coffeeStationClean)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Coffee station is clean and sanitary")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.sinkNoLeak)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Sink is free of leaks")
                    }
                    
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage6Model.page6sec3Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage6Model.page6sec3Comments)
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

