//
//  BCPageEight.swift
//  GenTest
//
//  Created by Danny Castro on 4/3/24.
//

import SwiftUI

struct BCPageEight: View {
    @Binding var currentPage: Int
    @Binding var branchChecklistPage8Model: BranchChecklistPage8Model
   
    var body: some View {
        VStack{
            Page8Sect1(branchChecklistPage8Model: $branchChecklistPage8Model)
            Page8Sect2(branchChecklistPage8Model: $branchChecklistPage8Model)
            Page8Sect3(branchChecklistPage8Model: $branchChecklistPage8Model)
            Page8Sect4(branchChecklistPage8Model: $branchChecklistPage8Model)
            Page8Sect5(branchChecklistPage8Model: $branchChecklistPage8Model)
            HStack{
                Button(action: {
                    currentPage = 6
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
                    currentPage = 8
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
                    Text("Page 8")
                }
                .padding(.horizontal)
            }
        }
    }
}
