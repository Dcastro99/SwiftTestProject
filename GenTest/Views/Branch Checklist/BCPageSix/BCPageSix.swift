//
//  BCPageSix.swift
//  GenTest
//
//  Created by Danny Castro on 4/2/24.
//

import SwiftUI

struct BCPageSix: View {
    @Binding var currentPage: Int
    @Binding var branchChecklistPage6Model: BranchChecklistPage6Model
    var body: some View {
        VStack{
            Page6Sect1(branchChecklistPage6Model: $branchChecklistPage6Model)
            Page6Sect2(branchChecklistPage6Model: $branchChecklistPage6Model)
            Page6Sect3(branchChecklistPage6Model: $branchChecklistPage6Model)
            HStack{
                Button(action: {
                    currentPage = 4
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
                    currentPage = 6
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
                    Text("Page 6")
                }
                .padding(.horizontal)
            }
        }
    }
}

