//
//  Page8Sect4.swift
//  GenTest
//
//  Created by Danny Castro on 4/5/24.
//

import SwiftUI

struct Page8Sect4: View {
    @Binding var branchChecklistPage8Model: BranchChecklistPage8Model
    
    let columns: [GridItem] = [
        GridItem(.flexible(minimum: 80, maximum: 400), spacing: 20, alignment: nil),
        GridItem(.flexible(minimum: 80, maximum: 400), spacing: 20, alignment: nil),
        GridItem(.flexible(minimum: 80, maximum: 400), spacing: 20, alignment: nil),
        GridItem(.flexible(minimum: 80, maximum: 400), spacing: 20, alignment: nil)
    ]
    
    
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                Divider2()
                
                Text("Other Equipment")
                    .font(.headline)
                    .fontWeight(.bold)
                LazyVGrid(columns: columns) {
                    ForEach(branchChecklistPage8Model.otherEquipList, id: \.assetNumber) { asset in
                        
                        Button(action: {
                            
                            branchChecklistPage8Model.selectedEquipment = asset
                            branchChecklistPage8Model.viewOtherEquipInfo = true
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
                        branchChecklistPage8Model.isAddingOtherEquip = true
                    }, label: {
                        if branchChecklistPage8Model.otherEquipList.isEmpty{
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
                    .sheet(isPresented: $branchChecklistPage8Model.isAddingOtherEquip) {
                        AddOtherEquipInfo(branchChecklistPage8Model: $branchChecklistPage8Model)
                        
                    }
                    .sheet(isPresented: $branchChecklistPage8Model.viewOtherEquipInfo) {
                        OtherEquipDetailInfo(assetInfo: $branchChecklistPage8Model.selectedEquipment,branchChecklistPage8Model: $branchChecklistPage8Model)
                        
                    }
                    
                }
               
            }//MAIN VSTACK
            .padding()
        }
    }
}
