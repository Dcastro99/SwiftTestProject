//
//  ForkLifts.swift
//  GenTest
//
//  Created by Danny Castro on 3/18/24.
//

import SwiftUI

extension Array {
    func chunk(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct ForkLifts: View {
    let mainBG = #colorLiteral(red: 0.9914150834, green: 0.9771276116, blue: 0.9294666648, alpha: 1)
    
    var body: some View {
        ZStack{
            Color(mainBG).ignoresSafeArea(.all)
            //            Color(mainBG)
            VStack{
                Grid(horizontalSpacing: 20, verticalSpacing: 20) {
                    
                    ForEach(forkLiftList.chunk(into: 3), id: \.self) { row in
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
                Text("Forklifts")
                    .font(.title)
            }
        }
        
    }
    private func assetDisplay(assetModel: AssetModel) -> some View {
        
        Button(action: {
            
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
            
        })
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10, x: 0, y: 10)
    }
}

#Preview {
    ForkLifts()
}

let forkLiftList = [
    AssetModel(assetNum: "4000", image: "https://i.imgur.com/tyTWmP0.png", type: "Forklift", model: "5500"),
    AssetModel(assetNum: "4001", image: "https://i.imgur.com/tyTWmP0.png", type: "Forklift", model: "5500"),
//    AssetModel(assetNum: "4002", image: "https://i.imgur.com/tyTWmP0.png", type: "Forklift", model: "5500"),
//    AssetModel(assetNum: "4003", image: "https://i.imgur.com/tyTWmP0.png", type: "Forklift", model: "5500"),
//    AssetModel(assetNum: "4004", image: "https://i.imgur.com/tyTWmP0.png", type: "Forklift", model: "5500"),
//    AssetModel(assetNum: "4005", image: "https://i.imgur.com/tyTWmP0.png", type: "Forklift", model: "5500"),
    
]
