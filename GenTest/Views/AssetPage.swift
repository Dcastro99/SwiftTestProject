//
//  AssetPage.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//

import SwiftUI

struct AssetPage: View {
    var body: some View {
        NavigationStack{
            List {
                NavigationLink("Pickers", destination: Pickers())
            }
        }
    }
}

#Preview {
    AssetPage()
}
