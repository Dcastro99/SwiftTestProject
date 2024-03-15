//
//  TMDashboard.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//

import SwiftUI

struct TMDashboard: View {
    @EnvironmentObject var storedUser: UserObs
    @State private var viz: NavigationSplitViewVisibility = .detailOnly

   
    let bgColor = #colorLiteral(red: 0.8131273912, green: 0.7377171282, blue: 0.578667129, alpha: 0.3209592301)
    let columnColor  = #colorLiteral(red: 0.9349857798, green: 0.9818981887, blue: 1, alpha: 0.3827090231)
    
    var body: some View {
       
        
            NavigationSplitView(columnVisibility: $viz){
                
                ZStack{
                    Color.clear
//                    Color(columnColor).ignoresSafeArea(.all)
                    Spacer()
                    List {
                        NavigationLink(destination: WillCallView()) {
                            Text("Home")
                                .font(.title)
                                .padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color.white)
                                .background(.black)
                                .cornerRadius(10)
                        }
                        NavigationLink(destination: ObservationForm()) {
                            Text("Observation Form")
                                .font(.title)
                                .padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color.white)
                                .background(.black)
                                .cornerRadius(10)
                            
                        }
                        
                        NavigationLink(destination: SaferBuckForms()) {
                            Text("Safer Buck Form")
                                .font(.title)
                                .padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color.white)
                                .background(.black)
                                .cornerRadius(10)
                        }
                        NavigationLink(destination: AssetPage()) {
                            Text("Assets")
                                .font(.title)
                                .padding()
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color.white)
                                .background(.black)
                                .cornerRadius(10)
                        }
                      
                        if storedUser.user?.branch_ids.count ?? 0 > 1 {
                            NavigationLink(destination: SelectBranch()) {
                                Text("Select Branch")
                                    .font(.title)
                                    .padding()
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.white)
                                    .background(.black)
                                    .cornerRadius(10)
                            }
                        }
                    }
                   
                }
                
                .background(Color(bgColor))
              
                
            } //NavSplit
            
           
        detail: {
        
            WillCallView()

        }
        .scrollContentBackground(.hidden)
        
  
    
    }
}


#Preview {
    TMDashboard()
}
