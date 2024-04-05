//
//  TMYearlyGoals.swift
//  GenTest
//
//  Created by Danny Castro on 3/18/24.
//

import SwiftUI

struct TMYearlyGoals: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Yearly Goals")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 80)
                .padding(.top,20)
            Divider()
                .padding(.horizontal, 30)
            Spacer()
            VStack{
                HStack {
                    Text("Goal 1: ")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Team Member to complete 3 cycle counts.")
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Complete")
                            .font(.title)
                            .padding(5)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.20)
                            .foregroundColor(Color.white)
                            .background(.black)
                            .cornerRadius(10)
                    })
                }
                HStack {
                    Text("Goal 2: ")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Team Member to proeficient in bin maintenance.")
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Complete")
                            .font(.title)
                            .padding(5)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.20)
                            .foregroundColor(Color.white)
                            .background(.black)
                            .cornerRadius(10)
                    })
                }
                HStack {
                    Text("Goal 1: ")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Team Member to conduct 3 ride-alongs with delivery team.")
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Complete")
                            .font(.title)
                            .padding(5)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.20)
                            .foregroundColor(Color.white)
                            .background(.black)
                            .cornerRadius(10)
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    TMYearlyGoals()
}
