//
//  Divider2.swift
//  GenTest
//
//  Created by Danny Castro on 3/27/24.
//

import SwiftUI

struct Divider2: View {
    let dividerColor = #colorLiteral(red: 0.7843137255, green: 0.3921568627, blue: 0.2039215686, alpha: 1)
    
    var body: some View {
        Rectangle()
            .fill(Color(dividerColor))
            .frame(height: 2)
            .edgesIgnoringSafeArea(.horizontal)
        
           
    }
}

#Preview {
    Divider2()
}
