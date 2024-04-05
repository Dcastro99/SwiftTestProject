//
//  Page7Sect4.swift
//  GenTest
//
//  Created by Danny Castro on 4/3/24.
//

import SwiftUI

struct Page7Sect4: View {
    @Binding var branchChecklistPage7Model: BranchChecklistPage7Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Divider2()
                
                Text("Housekeeping - Outside")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment:.leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.parkinglotClean)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Parking lot is kept clean and clear of debris")
                    }
                    HStack{
                        HStack{
                            Toggle("", isOn: $branchChecklistPage7Model.dunageOrganized)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Pallets, cradles, and skids are organized")
                        }
                    Spacer()
                            .frame(maxWidth: 150)
                        HStack{
                            Toggle("", isOn: $branchChecklistPage7Model.dunageNA)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("N/A")
                        }
//                        .padding(.leading, 60)
                    }
                    
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.noWeeds)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("No weeds or vegetation within 15 ft of items stored outside")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.landscapingMaintained)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Landscaping is maintained regularly to make building presentable")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage7Model.page7sec4Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage7Model.page7sec4Comments)
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

