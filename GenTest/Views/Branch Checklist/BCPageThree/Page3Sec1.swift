//
//  Page3Sec1.swift
//  GenTest
//
//  Created by Danny Castro on 3/29/24.
//

import SwiftUI

struct Page3Sec1: View {
    @Binding var branchChecklistPage3Model: BranchChecklistPage3Model
    
    
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
                
                Text("Elevated Surfaces & Mezzanines")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage3Model.loadCapacityMarked)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Load Capacity of mezzanine is clearly Marked")
                        Spacer()
                        HStack{
                            Text("Load Capacity: ")
                            TextField("lbs",text:$branchChecklistPage3Model.mezLoadCapacity)
                            .padding(.leading)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.ultraThinMaterial)
                                        
                                )
                                .frame(maxWidth: 100)
                        }
                        .padding(.horizontal,60)
                    }
                   
                    HStack{
                        Toggle("", isOn: $branchChecklistPage3Model.securedDocks)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Dock boards or bridge plates are used and secured between docks and trucks")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage3Model.visualDockBarriers)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Visual barriers for loading docks if doors are left open with NO truck backed in")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage3Model.page3sec1Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage3Model.page3sec1Comments)
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

//#Preview {
//    Page3Sec1()
//}
