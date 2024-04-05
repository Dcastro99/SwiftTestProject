//
//  Page2Sec1.swift
//  GenTest
//
//  Created by Danny Castro on 3/28/24.
//

import SwiftUI

struct Page2Sec1: View {
    @Binding var branchChecklistPage2Model: BranchChecklistPage2Model
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
                
                Text("Hazard Communication")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.sdsKnowledge)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Team Members know what SDS (Safety Data Sheets) are and what they are used for")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.accessToMSDSonline)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Signs posted with instructions to access MSDSonline through GenscoTeam.com")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage2Model.page2sec1Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage2Model.page2sec1Comments)
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
//    Page2Sec1()
//}
