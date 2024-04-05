//
//  BCPageFour.swift
//  GenTest
//
//  Created by Danny Castro on 3/29/24.
//

import SwiftUI

struct BCPageFour: View {
    @Binding var currentPage: Int
    @Binding var branchChecklistPage4Model: BranchChecklistPage4Model
    var body: some View {
        VStack{
            Page4Sect1(branchChecklistPage4Model: $branchChecklistPage4Model)
            Page4Sect2(branchChecklistPage4Model: $branchChecklistPage4Model)
            Page4Sect3(branchChecklistPage4Model: $branchChecklistPage4Model)
            Page4Sect4(branchChecklistPage4Model: $branchChecklistPage4Model)
            HStack{
                Button(action: {
                    currentPage = 2
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
                    currentPage = 4
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
                    Text("Page 4")
                }
                .padding(.horizontal)
            }
        }
    }
}

