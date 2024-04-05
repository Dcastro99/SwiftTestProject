//
//  TMProfileView.swift
//  GenTest
//
//  Created by Danny Castro on 3/18/24.
//

import SwiftUI

struct TMProfileView: View {
    
   
    let mainBGColor = #colorLiteral(red: 0.9028440286, green: 0.9282310816, blue: 0.8978329126, alpha: 1)
    let bgColor = #colorLiteral(red: 0.7311046716, green: 0.7320233823, blue: 0.7159757937, alpha: 0.3209592301)
    var body: some View {
        ZStack{
            Color.white.ignoresSafeArea(.all)
            HStack(alignment:  .top,spacing:0){
                VStack( spacing: 80){
//                    Color.blue
                    Spacer()
                        NavigationLink {
                            WillCallView()
                        } label: {
                            Text("Dashboard")
                                .font(.title)
                                .padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color.white)
                                .background(.black)
                                .cornerRadius(10)
                        }
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Reviews")
                            .font(.title)
                            .padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                            .background(.black)
                            .cornerRadius(10)
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Proficiency")
                            .font(.title)
                            .padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                            .background(.black)
                            .cornerRadius(10)
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Task List")
                            .font(.title)
                            .padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.white)
                            .background(.black)
                            .cornerRadius(10)
                    })
                    Spacer()
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width * 0.20)
                .padding(8)
                ZStack{
                    Color(bgColor)
                    VStack(spacing:20){

                  
                       
                        ZStack{
//                            Color(mainBGColor)
                            Color.white
                            TMProfileInfo()

                        }

                        .cornerRadius(25)
                        
                        ZStack{
//                            Color(mainBGColor)
                            Color.white
                            TMSaferBucks()
                        }
                        .cornerRadius(25)
                        ZStack{
//                            Color(mainBGColor)
                            Color.white
                            TMYearlyGoals()
                        }
                        .cornerRadius(25)
                    }
                .padding(.vertical, 25)
                .padding(.horizontal, 10)
                }
                .cornerRadius(25)
                
               
            }
            .padding()
            
        }
    }
}

#Preview {
    TMProfileView()
}
