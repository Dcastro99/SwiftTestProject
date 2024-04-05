//
//  testPage.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//
//
import SwiftUI



struct testPage: View {
    @State private var isChecked = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Toggle("", isOn: $isChecked)
                    .toggleStyle(Checkbox())
                    .font(.system(size: 25))
    //                .padding()
                Text("Battery")
            }
            HStack{
                Toggle("", isOn: $isChecked)
                    .toggleStyle(Checkbox())
                    .font(.system(size: 25))
                //                .padding()
                Text("Accelorator")
            }
            HStack{
                Toggle("", isOn: $isChecked)
                    .toggleStyle(Checkbox())
                    .font(.system(size: 25))
                //                .padding()
                Text("Steering Wheel")
            }
        }
    }
}





#Preview {
    testPage()
}
