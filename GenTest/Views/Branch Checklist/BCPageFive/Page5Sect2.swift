//
//  Page5Sect2.swift
//  GenTest
//
//  Created by Danny Castro on 4/2/24.
//

import SwiftUI

struct Page5Sect2: View {
   @Binding var branchChecklistPage5Model: BranchChecklistPage5Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Divider2()
                
                Text("Material Handling")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.safetyClearance)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Safe clearances for equipment through aisles and doorways")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.palletStackingLimit)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Empty pallets are not to be stacked more than 20 high and must be staged on the floor")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.palletInspection)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Pallets inspected before loading or moving")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.handTruckCondition)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Hand trucks maintained in good condition (Defective hand trucks to be discarded and replaced)")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.wheelChocks)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Wheel chocks are provided for each dock door and used while loading/unloading trucks and trailers")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.dockBaordsAndPlates)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Dock boards/plates are used while loading/unloading between vehicles and docks")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage5Model.page5sec2Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage5Model.page5sec2Comments)
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

