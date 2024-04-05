//
//  Page5Sect3.swift
//  GenTest
//
//  Created by Danny Castro on 4/2/24.
//

import SwiftUI

struct Page5Sect3: View {
    @Binding var branchChecklistPage5Model: BranchChecklistPage5Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Divider2()
                
                Text("Racking")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.loadCapacitySigns)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Load capacity signs are posted and accurate for each aisle")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.shelveLoadLimit)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Load on shelves DO NOT exceed the capacity of the beams")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.loadBeanNotDamaged)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Load beams are free from damage and are using proper locking mechanisms")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.upsrightsNotDamaged)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Uprights are free from damage with at least 2 floor bolts per foot and installed in the proper orientation")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.cantileverNotDamaged)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Cantilever is free from damage with containment device on each level (e.g. - chains, extended pins)")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage5Model.page5sec3Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage5Model.page5sec3Comments)
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

