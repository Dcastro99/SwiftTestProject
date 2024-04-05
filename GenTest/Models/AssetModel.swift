//
//  AssetModel.swift
//  GenTest
//
//  Created by Danny Castro on 3/20/24.
//

import SwiftUI

struct AssetModel: Identifiable, Hashable {
    let id = UUID()
    let assetNum: String
    let image: String
    let type: String
    let model: String
    
    static let temporary = AssetModel(assetNum: "4000", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500")

}

