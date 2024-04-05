//
//  AssetPage.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//

import SwiftUI

struct AssetPage: View {
    let bgColor = #colorLiteral(red: 0.8131273912, green: 0.7377171282, blue: 0.578667129, alpha: 0.3209592301)
    
    var body: some View {
      
                NavigationStack{
                    ZStack{
                        Color(bgColor).ignoresSafeArea(.all)
//                        List{
                        VStack{
                            NavigationLink( destination: Pickers()){
                                Text("Pickers")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding()
                                    .background(.black)
                                    .cornerRadius(8)
                            }
                                .padding()
                            
                            NavigationLink(destination: ForkLifts()){
                                Text("Forklifts")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding()
                                    .background(.black)
                                    .cornerRadius(8)
                            }
                                .padding()
                        }
                    }
                    .scrollContentBackground(.hidden)

                }


    }
}

#Preview {
    AssetPage()
}
