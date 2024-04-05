//
//  TMProfileInfo.swift
//  GenTest
//
//  Created by Danny Castro on 3/18/24.
//

import SwiftUI

struct TMProfileInfo: View {
    @EnvironmentObject var storedUser: UserObs
//    var photoURL = URL(string:)
    var body: some View {
        VStack{
            Spacer()
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 120, height: 120)
                .overlay {
                    AsyncImage(url: URL(string:storedUser.user?.image ?? "")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        
                    }
                    
                placeholder: {
                    ProgressView()
                }
                }
                .padding(.top,10)
            
            VStack(alignment: .leading){
                Spacer()
                HStack{
                    //                                        Spacer()
                    
                    Text(storedUser.user?.branchName ?? "")
                    Spacer()
                    //                                        Spacer()
                    Divider()
                        .frame(height: 30)
                    Spacer()
                    Text(storedUser.user?.roleDescription ?? "none")
                    //                                        Spacer()
                    
                    //                                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal,80)
                .frame(maxWidth: .infinity)
                
                Spacer()
                Text(storedUser.user?.name ?? "temp")
                    .padding(.horizontal,80)
                
                Divider()
                    .padding(.horizontal,80)
                    .padding(.bottom,20)
                Text(storedUser.user?.email ?? "")
                    .padding(.horizontal,80)
                Divider()
                    .padding(.horizontal,80)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            //                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    TMProfileInfo()
}
