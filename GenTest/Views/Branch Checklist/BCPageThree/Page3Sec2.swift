//
//  Page3Sec2.swift
//  GenTest
//
//  Created by Danny Castro on 3/29/24.
//

import SwiftUI

struct Page3Sec2: View {
    @Binding var branchChecklistPage3Model: BranchChecklistPage3Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Divider2()
                
                Text("Walkways & Stairways")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage3Model.clearPath)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Aisles and passageways kept clear and at least 28\" wide")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage3Model.noObstructedPaths)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Equipment and material stored so sharp objects cannot obstruct walkways")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage3Model.adiquateHeadroom)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Adequate headroom (at least 7 feet) provide for entire length of walkways/stairs")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage3Model.goodFloors)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Floors are free of holes, projections, or depressions that could cause trips or let material fall below")
                    }
                    HStack{
                        VStack(alignment: .leading){
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.standardGuardrails)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Standard guardrails provided wherever surfaces are elevated more than 4 feet")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.withstand200lbs)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Guardrails 36\" - 42\" high are capable of withstanding 200 lbs of force in any direction")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.toeBoards)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Toe boards installed to prevent debris from failling below")
                            }
                        }
                        VStack(alignment:.leading){
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.guardrailsNA)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("N/A")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.withstandNA)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("N/A")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.toeBoardsNA)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("N/A")
                            }
                        }
                        
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage3Model.page3sec2Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage3Model.page3sec2Comments)
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

