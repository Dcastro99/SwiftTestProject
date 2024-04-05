//
//  Page8Sect3.swift
//  GenTest
//
//  Created by Danny Castro on 4/5/24.
//

import SwiftUI

struct Page8Sect3: View {
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
                
                Text("Order Pickers")
                    .font(.headline)
                    .fontWeight(.bold)
                LazyVGrid(columns: columns) {
                    ForEach(branchChecklistPage8Model.pickerList, id: \.assetNumber) { asset in
                        
                        Button(action: {
                            
                            branchChecklistPage8Model.selectedPicker = asset
                            branchChecklistPage8Model.viewPickerInfo = true
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
                        branchChecklistPage8Model.isAddingPicker = true
                    }, label: {
                        if branchChecklistPage8Model.pickerList.isEmpty{
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
                    .sheet(isPresented: $branchChecklistPage8Model.isAddingPicker) {
                        AddPickerInfo(branchChecklistPage8Model: $branchChecklistPage8Model)
                        
                    }
                    .sheet(isPresented: $branchChecklistPage8Model.viewPickerInfo) {
                        PickerDetailInfo(assetInfo: $branchChecklistPage8Model.selectedPicker,branchChecklistPage8Model: $branchChecklistPage8Model)
                        
                    }
                    
                }
            }//MAIN VSTACK
            .padding()
        }
    }
}

//#Preview {
//    Page8Sect3()
//}
