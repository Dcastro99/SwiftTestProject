//
//  Page5Sect1.swift
//  GenTest
//
//  Created by Danny Castro on 4/2/24.
//

import SwiftUI

struct Page5Sect1: View {
    @Binding var branchChecklistPage5Model: BranchChecklistPage5Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                HStack{
                    let url = URL(string:"https://i.imgur.com/36OFTeQ.png")
                    
                    
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case.empty:
                            ProgressView()
                        case.success(let returnImage):
                            
                            returnImage
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200)
                                .background(.clear)
                        case.failure:
                            VStack(spacing:20){
                                Image(systemName: "exclamationmark.triangle.fill")
                                    .font(.system(size: 100))
                                
                                Text("No image found!")
                                    .font(.title)
                            }
                            
                        default:
                            Image(systemName: "questionmark")
                                .font(.title)
                        }
                    }
                    Spacer()
                    Text("Branch Inspection Checklist")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.accentColor)
                        .padding(.trailing, 50)
                    
                    
                }
                Divider2()
                
                Text("Portable Ladders")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.laddersSecured)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("All ladders are securely stored")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.nonSlip)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Non-slip safety feet on all ladders")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.goodCondition)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("All ladders are in good condition with no missing parts (Defective ladders will be replaced immediately)")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.nonGrease)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Ladder rungs and steps are free of grease and oil")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.topStepSafety)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Top step on ladder NOT to be used as a step")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage5Model.ladderOnSolidGround)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Ladders cannot be placed on boxes, or other other items, to obtain additional height")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage5Model.page5sec1Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage5Model.page5sec1Comments)
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

