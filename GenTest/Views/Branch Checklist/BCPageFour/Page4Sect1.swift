//
//  Page4Sect1.swift
//  GenTest
//
//  Created by Danny Castro on 3/29/24.
//

import SwiftUI

struct Page4Sect1: View {
    @Binding var branchChecklistPage4Model: BranchChecklistPage4Model
 
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
                
                Text("Electrical")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.breakerBoxClear)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Breaker boxes are kept clear and can be accessed when needed")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.hotPanel)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Look at electrical panel(s) and check to make sure they are not hot")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage4Model.noPermanentExtensionChords)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Extension cords are ONLY used for temporary use, NOT a permanent source of power")
                    }
                    HStack(alignment: .top){
                        Toggle("", isOn: $branchChecklistPage4Model.containsGroundwire)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Extension cords MUST contain a ground (3-wire) or are marked as double insulated and in good repair")
                    }
                    HStack(alignment: .top){
                        Toggle("", isOn: $branchChecklistPage4Model.extensionChordsAndSurgeTogether)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Extension cords and surge protectors are NOT to be connected together to obtain more power outlets")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage4Model.page4sec1Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage4Model.page4sec1Comments)
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


