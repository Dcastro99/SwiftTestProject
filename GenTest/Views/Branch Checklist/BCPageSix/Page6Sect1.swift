//
//  Page6Sect1.swift
//  GenTest
//
//  Created by Danny Castro on 4/2/24.
//

import SwiftUI

struct Page6Sect1: View {
    @Binding var branchChecklistPage6Model: BranchChecklistPage6Model
    
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
                
                Text("Products and Staging")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment:.leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.productOverflowing)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Product reside within the staging zones (NOT overflowing into main aisles)")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.productLeaning)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Product does NOT lean into aisles, over racking, or over the marked staging lines")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.boxTopsCut)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Open box tops are cut off (With the EXCEPTION of air filters)")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.newProductNotDamaged)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Boxes containing new product are undamaged")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.productSecured)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Product is stacked with no danger of falling or collapsing")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.productNotStackedTooHigh)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Product is NOT stacked too high or in places where team members cannot safely stock/pull product")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage6Model.page6sec1Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage6Model.page6sec1Comments)
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
