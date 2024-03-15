//
//  testPage.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//
//
import SwiftUI



struct testPage: View {
    
 
    
    var body: some View {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        let dateString = formatter.string(from: Date())
        
        return Text("Today's Date: \(dateString)")
            .padding()
    }
}





#Preview {
    testPage()
}
