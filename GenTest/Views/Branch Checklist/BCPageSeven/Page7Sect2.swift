//
//  Page7Sect2.swift
//  GenTest
//
//  Created by Danny Castro on 4/3/24.
//

import SwiftUI

struct Page7Sect2: View {
    @Binding var branchChecklistPage7Model: BranchChecklistPage7Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                Divider2()
                
                Text("Housekeeping - Lunch/Break Room")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment:.leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.overallClean)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Floors, counters, furniture, and cabinets are clean")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.fridgeClean)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Refrigerator is clean, organized, and does NOT contain outdated or Spoiled food")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.microwaveMaintained)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Microwave is cleaned regularly")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.ovenClean)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Oven is cleaned regularly and does NOT have built up baked-on food")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.sinkNoLeaks)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Sink is free of leaks")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage7Model.page7sec2Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage7Model.page7sec2Comments)
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

