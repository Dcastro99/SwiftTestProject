//
//  Page7Sect1.swift
//  GenTest
//
//  Created by Danny Castro on 4/3/24.
//

import SwiftUI

struct Page7Sect1: View {
    @Binding var branchChecklistPage7Model: BranchChecklistPage7Model
    
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
                        .fontWeight(.bold)
                        .foregroundStyle(Color.accentColor)
                        .padding(.trailing, 50)
                    
                    
                }
                Divider2()
                
                Text("Housekeeping - Office Space / Conference Room")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.noStains)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Carpet is free from stains and damage")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage7Model.furnitureGoodCondition)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Tables, chairs, and other office furniture is in good condition")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage7Model.page7sec1Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage7Model.page7sec1Comments)
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


