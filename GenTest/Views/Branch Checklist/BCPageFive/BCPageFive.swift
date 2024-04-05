//
//  BCPageFive.swift
//  GenTest
//
//  Created by Danny Castro on 4/2/24.
//

import SwiftUI

struct BCPageFive: View {
    @Binding var currentPage: Int
    @Binding var branchChecklistPage5Model: BranchChecklistPage5Model
    var body: some View {
        VStack{
            Page5Sect1(branchChecklistPage5Model: $branchChecklistPage5Model)
            Page5Sect2(branchChecklistPage5Model: $branchChecklistPage5Model)
            Page5Sect3(branchChecklistPage5Model: $branchChecklistPage5Model)
            HStack{
                Button(action: {
                    currentPage = 3
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
                    currentPage = 5
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
                    Text("Page 5")
                }
                .padding(.horizontal)
            }
        }
    }
}

//#Preview {
//    BCPageFive()
//}
