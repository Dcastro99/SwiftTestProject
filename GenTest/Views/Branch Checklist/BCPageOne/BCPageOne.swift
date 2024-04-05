//
//  BCPageOne.swift
//  GenTest
//
//  Created by Danny Castro on 3/27/24.
//

import SwiftUI

struct BCPageOne: View {
    @Binding var currentPage: Int
    @Binding var branchChecklistPage1Model: BranchChecklistPage1Model
    var body: some View {
        VStack{
            Page1Sec1(branchChecklistPage1Model: $branchChecklistPage1Model)
            Page1Sec2(branchChecklistPage1Model: $branchChecklistPage1Model)
            Page1Sec3(branchChecklistPage1Model: $branchChecklistPage1Model)
            Button(action: {
                currentPage = 1
            }, label: {
                Text("Next")
                    .font(.title)
                    .foregroundStyle(Color.accentColor)
                    .padding(.horizontal ,25)
                    .padding(.vertical,10)
                    .background(Color.black)
                    .cornerRadius(10)
            })
            .padding(.bottom)
            Spacer()
            Divider2()
                .padding(.horizontal)
            VStack(alignment:.trailing){
                HStack{
                    Spacer()
                    Text("Page 1")
                }
                .padding(.horizontal)
            }
        }
    }
}

//#Preview {
//    BCPageOne()
//}
