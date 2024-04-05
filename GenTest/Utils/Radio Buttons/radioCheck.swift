//
//  radioCheck.swift
//  GenTest
//
//  Created by Danny Castro on 3/19/24.
//

import SwiftUI

struct radioCheck: View {
    var body: some View {
        ZStack{
            Color.red
            Form{
                VStack{
                    Text("hey")
                   
                }
            }
            HStack {
                Text("Points")
                    .font(Font.headline)
                RadioButtonGroups { selected in
                    print("Points selected is: \(selected)")
                }
            }
        }
    }
}

#Preview {
    radioCheck()
}
