//
//  Page8Sect5.swift
//  GenTest
//
//  Created by Danny Castro on 4/5/24.
//

import SwiftUI

struct Page8Sect5: View {
    @Binding var branchChecklistPage8Model: BranchChecklistPage8Model
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 80, maximum: 400), spacing: 20, alignment: nil),
        GridItem(.flexible(minimum: 80, maximum: 400), spacing: 20, alignment: nil),
        GridItem(.flexible(minimum: 80, maximum: 400), spacing: 20, alignment: nil),
        GridItem(.flexible(minimum: 80, maximum: 400), spacing: 20, alignment: nil)
    ]
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                Divider2()
                
                Text("Delivery Vihecles")
                    .font(.headline)
                    .fontWeight(.bold)
                LazyVGrid(columns: columns) {
                    ForEach(branchChecklistPage8Model.DVList, id: \.assetNumber) { asset in
                        
                        Button(action: {
                            
                            branchChecklistPage8Model.selectedDV = asset
                            branchChecklistPage8Model.viewDVInfo = true
                            //
                        }, label: {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .frame(maxWidth: 75, minHeight: 40, maxHeight: 60)
                                .shadow(radius: 10, x: 2, y: 8)
                                .overlay(
                                    Text(asset.assetNumber)
                                        .font(.headline)
                                )
                        })
                    }
                    Button(action: {
                        branchChecklistPage8Model.isAddingDV = true
                    }, label: {
                        if branchChecklistPage8Model.DVList.isEmpty{
                            HStack{
                                Text("Add asset ...")
                                Image(systemName: "plus.rectangle.fill")
                                    .font(.title)
                            }
                        }else{
                            Image(systemName: "plus.rectangle.fill")
                                .font(.title)
                        }
                    })
                    .padding(.top,40)
                    .sheet(isPresented: $branchChecklistPage8Model.isAddingDV) {
                        AddDVInfo(branchChecklistPage8Model: $branchChecklistPage8Model)
                        
                    }
                    .sheet(isPresented: $branchChecklistPage8Model.viewDVInfo) {
                        DVDetailInfo(assetInfo: $branchChecklistPage8Model.selectedDV,branchChecklistPage8Model: $branchChecklistPage8Model)
                        
                    }
                    
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage8Model.page8sec5Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage8Model.page8sec5Comments)
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
