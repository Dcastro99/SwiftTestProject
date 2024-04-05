//
//  TMSaferBucks.swift
//  GenTest
//
//  Created by Danny Castro on 3/18/24.
//

import SwiftUI

struct TMSaferBucks: View {
    //
    var sbPhoto = URL(string:"https://i.imgur.com/JNWm2GJ.png")
    var body: some View {
        VStack(alignment: .leading){
        
            Text("Safer Bucks")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.horizontal, 80)
                .padding(.top,20)
            Divider()
                .padding(.horizontal, 30)
            Spacer()
            HStack{
            
                VStack{
                    
                    HStack{
                        Text("Total Bucks: ")
                            .font(.headline)
                      
                        Text("0")
                            .padding(8)
                            .font(.headline)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
//                            .cornerRadius(8)
                        
                    }
                    VStack(spacing: 20)  {
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("View")
                                .font(.title)
                                .padding(5)
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.20)
                                .foregroundColor(Color.white)
                                .background(.black)
                                .cornerRadius(10)
                        })
                    
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Redeem")
                                
                                .font(.title)
                                .padding(5)
                                .frame(maxWidth: UIScreen.main.bounds.width * 0.20)
                                .foregroundColor(Color.white)
                                .background(.black)
                                .cornerRadius(10)
                        })
                    }

                }
                .padding(8)
//                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
              Spacer()
//
                    
                ZStack{
                    AsyncImage(url: sbPhoto) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Rectangle())
//                            .frame(  maxWidth: 400, maxHeight: 200)
                        
                    }
                
                placeholder: {
                    ProgressView()
                }
//                .padding(50)
//                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }
                .padding()
              
            }//MAIN HASTACK
            .padding(.horizontal,20)

            Spacer()
        }
        .frame(maxWidth: .infinity)
     
    }
}

#Preview {
    TMSaferBucks()
}
