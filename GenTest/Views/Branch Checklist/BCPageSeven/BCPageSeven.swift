//
//  BCPageSeven.swift
//  GenTest
//
//  Created by Danny Castro on 4/3/24.
//

import SwiftUI

struct BCPageSeven: View {
    @Binding var currentPage: Int
    @Binding var branchChecklistPage7Model: BranchChecklistPage7Model
    var body: some View {
        VStack{
            Page7Sect1(branchChecklistPage7Model:$branchChecklistPage7Model)
            Page7Sect2(branchChecklistPage7Model:$branchChecklistPage7Model)
            Page7Sect3(branchChecklistPage7Model:$branchChecklistPage7Model)
            Page7Sect4(branchChecklistPage7Model:$branchChecklistPage7Model)
            HStack{
                Button(action: {
                    currentPage = 5
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
                    currentPage = 7
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
                    Text("Page 7")
                }
                .padding(.horizontal)
            }
        }
    }
}
