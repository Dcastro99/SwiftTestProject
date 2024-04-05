//
//  scrap.swift
//  GenTest
//
//  Created by Danny Castro on 3/21/24.
//

import SwiftUI

struct scrap: View {
    let pickerInfo: AssetModel
    @State private var selectedNames: Set<String> = []
    
    let data = [
        "Alice",
        "Bob",
        "Charlie",
        "David",
        "Eve",
        "Frank"
    ]
    
    var body: some View {
        Text("picker \(pickerInfo.assetNum)")
    }
//    func printSelectedNames() {
//        print(selectedNames)
//    }
    


}



//
//#Preview {
//    scrap()
//}
