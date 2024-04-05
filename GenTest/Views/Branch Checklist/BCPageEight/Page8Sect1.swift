//
//  Page8Sect1.swift
//  GenTest
//
//  Created by Danny Castro on 4/3/24.
//

import SwiftUI

struct Page8Sect1: View {
@Binding var branchChecklistPage8Model: BranchChecklistPage8Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
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
                        .fontWeight(.bold)
                        .foregroundStyle(Color.accentColor)
                        .padding(.trailing, 50)
                    
                    
                }
                Divider2()
                
                Text("Material Handling Equipment (MHE)")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage8Model.operatorsCertified)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("All Operators are certified to operate respective MHE and documentation is on file")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage8Model.fallProtection)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("All team members use fall protection, fall protection is in good condition, and is less than 5 years old")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage8Model.dailyChecklist)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Team members inspect MHE prior to use each day and/or shift")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage8Model.batteriesCharged)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Batteries are charged in a well ventilated area free of combustible material")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage8Model.spillKitAvailable)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Spill kit is available to clean up hazardous material")
                    }
                }
            }//MAIN VSTACK
            .padding()
        }
    }
}

