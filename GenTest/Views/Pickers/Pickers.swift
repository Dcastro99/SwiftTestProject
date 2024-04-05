//
//  Pickers.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//

import SwiftUI

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct Pickers: View {
    let mainBG = #colorLiteral(red: 0.9914150834, green: 0.9771276116, blue: 0.9294666648, alpha: 1)
    @State private var showSheet: Bool = false
    @State private var selectedAssetModel: AssetModel? = nil
    var body: some View {
        ZStack{
            Color(mainBG).ignoresSafeArea(.all)
            //            Color(mainBG)
            VStack{
                Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                    
                    ForEach(pickerList.chunked(into: 3), id: \.self) { row in
                        GridRow {
                            ForEach(row, id: \.self.id) { assetModel in
                                
                                assetDisplay(assetModel: assetModel)
                                  
                            }
                        }
                    }
                }
                .padding()
                Spacer()
            }
          
            
        }
        .toolbar{
            ToolbarItem(placement: .principal){
                Text("Pickers")
                    .font(.title)
            }
        }
        
    }
    private func assetDisplay(assetModel: AssetModel) -> some View {
        
        Button(action: {
//            showSheet.toggle()
            selectedAssetModel = assetModel
        }, label: {
            ZStack{
                
                VStack {
                    let url = URL(string:assetModel.image)
                    
                    
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case.empty:
                            ProgressView()
                        case.success(let returnImage):
                            
                            returnImage
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 175)
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
                    Text(assetModel.assetNum)
                        .font(.title)
                        .foregroundStyle(Color.black)
                    
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
            }
            .shadow(radius: 10, x: 0, y: 10)
            .sheet(item: $selectedAssetModel) { assetModel in
                PickerDisplay(pickerInfo: assetModel)
            }
//            .sheet(isPresented: $showSheet, content:  {
//                PickerDisplay(pickerInfo: assetModel)
//                //                                        PickerDisplay(pickerInfo: assetModel)
//                //            testPage()
//                //                .presentationDetents([.])
//            })
        })
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10, x: 0, y: 10)
       
    }
}

#Preview {
    Pickers()
}


let pickerList = [
    AssetModel(assetNum: "4035", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500"),
    AssetModel(assetNum: "4036", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500"),
    AssetModel(assetNum: "4037", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500"),
    AssetModel(assetNum: "4038", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500"),
    AssetModel(assetNum: "4039", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500"),
    AssetModel(assetNum: "4040", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500"),
    
]
