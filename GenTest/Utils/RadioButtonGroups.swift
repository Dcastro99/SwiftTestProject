//
//  RadioButtonGroups.swift
//  GenTest
//
//  Created by Danny Castro on 3/19/24.
//

import SwiftUI

enum Points: String {
    case points100 = "100"
    case points200 = "200"
    case points300 = "300"
    case points400 = "400"
    case points500 = "500"
}


struct RadioButtonGroups: View {
    let callback: (String) -> ()
    @State private var selectedId: String = ""
    
    let points: [Points] = [.points100, .points200, .points300, .points400, .points500]
    
    var body: some View {
        HStack {
            ForEach(points, id: \.self) { point in
                RadioButtonField(
                    id: point.rawValue,
                    label: point.rawValue,
                    isMarked: selectedId == point.rawValue,
                    callback: { id in
                        selectedId = id
                        callback(id)
                    }
                )
                
            }
        }
    }
}


