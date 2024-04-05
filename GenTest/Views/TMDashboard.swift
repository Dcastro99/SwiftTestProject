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
 

    let mainBG = #colorLiteral(red: 0.9914150834, green: 0.9771276116, blue: 0.9294666648, alpha: 1)
    let bgColor = #colorLiteral(red: 0.8131273912, green: 0.7377171282, blue: 0.578667129, alpha: 0.3209592301)
    let columnColor  = #colorLiteral(red: 0.9349857798, green: 0.9818981887, blue: 1, alpha: 0.3827090231)
    var photoURL = URL(string:"https://i.imgur.com/Khvk5Fj.jpeg")
    var body: some View {
       
        
            NavigationSplitView(columnVisibility: $viz){
                
                ZStack{
                    Color.clear
                    Spacer()
                   VStack {
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
                            NavigationLink(destination: AisleMaintenanceView()) {
                                Text("Aisle Maintenace")
                                    .font(.title)
                                    .padding()
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.white)
                                    .background(.black)
                                    .cornerRadius(10)
                            }
                            NavigationLink(destination: BranchChecklistMain()) {
                                Text("Branch Checklist")
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
                        
                       HStack{
                           Button(action: {
                               UserSession.signOut()
                           }
                                  , label: {
                               Image(systemName: "rectangle.portrait.and.arrow.forward")
                                   .font(.system(size: 30))
                                   .foregroundColor(.black)
                           })
                           Spacer()
                               NavigationLink(destination: TMProfileView()) {
                                   Circle()
                                       .fill(Color.blue)
                                       .frame(width: 50, height: 50)
                                       .overlay {
                                           AsyncImage(url: URL(string:storedUser.user?.image ?? "")) { image in
                                               image
                                                   .resizable()
                                                   .aspectRatio(contentMode: .fill)
                                                   .clipShape(Circle())
                                           }
                                       placeholder: {
                                           ProgressView()
                                       }
                               }
                           }
                       }
                       .padding(25)
                    }
                   
                }
                
                .background(Color(mainBG))
           
                
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
