//
//  BCPageTwo.swift
//  GenTest
//
//  Created by Danny Castro on 3/28/24.
//

import SwiftUI

struct BCPageTwo: View {
    @Binding var currentPage: Int
    @Binding var branchChecklistPage2Model: BranchChecklistPage2Model
    var body: some View {
        VStack{
            Page2Sec1(branchChecklistPage2Model: $branchChecklistPage2Model)
            Page2Sec2(branchChecklistPage2Model: $branchChecklistPage2Model)
            Page2Sec3(branchChecklistPage2Model: $branchChecklistPage2Model)
            HStack{
                Button(action: {
                    currentPage = 0
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
                    currentPage = 2
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
                    Text("Page 2")
                }
                .padding(.horizontal)
            }
        }
        }
}

//#Preview {
//    BCPageTwo()
//}
