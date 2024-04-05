//
//  BCPageThree.swift
//  GenTest
//
//  Created by Danny Castro on 3/29/24.
//

import SwiftUI

struct BCPageThree: View {
    @Binding var currentPage: Int
    @Binding var branchChecklistPage3Model : BranchChecklistPage3Model
    
    var body: some View {
        VStack{
            Page3Sec1(branchChecklistPage3Model: $branchChecklistPage3Model)
            Page3Sec2(branchChecklistPage3Model: $branchChecklistPage3Model)
            Page3Sec3(branchChecklistPage3Model: $branchChecklistPage3Model)
           
            HStack{
                Button(action: {
                    currentPage = 1
                }, label: {
                    Text("back")
                        .font(.title)
                        .foregroundStyle(Color.accentColor)
                        .padding(.horizontal ,25)
                        .padding(.vertical,10)
                        .background(Color.black)
                        .cornerRadius(10)
                })
                Button(action: {
                    currentPage = 3
                }, label: {
                    Text("Next")
                        .font(.title)
                        .foregroundStyle(Color.accentColor)
                        .padding(.horizontal ,25)
                        .padding(.vertical,10)
                        .background(Color.black)
                        .cornerRadius(10)
                })
            }
            .frame(maxWidth: 600)
            .padding(.bottom)
            Spacer()
            Divider2()
                .padding(.horizontal)
            VStack(alignment:.trailing){
                HStack{
                    Spacer()
                    Text("Page 3")
                }
                .padding(.horizontal)
            }
        }
    }
}

//#Preview {
//    BCPageThree()
//}
