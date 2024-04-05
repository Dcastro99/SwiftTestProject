//
//  AisleMaintenaceHeader.swift
//  GenTest
//
//  Created by Danny Castro on 3/25/24.
//

import SwiftUI

struct AisleMaintenaceHeader: View {
    @EnvironmentObject var storedUser: UserObs
    @Binding var aisle: String
    @State var buttonClicked: Int?
  
    let dividerColor = #colorLiteral(red: 0.7836529594, green: 0.7627409962, blue: 0.7736164322, alpha: 0.5)
    
    var body: some View {
        let currentDateTime = Date()
        let pickerDate = formatLongDate(from: currentDateTime)
        let pickerTime = formatTime(from: Date())
        
        let number = storedUser.user?.empNum ?? 0
        let formatter = NumberFormatter()
        
        VStack(alignment: .leading){

            HStack(alignment: .top){

                Spacer()
                HStack(alignment:.top){
                    VStack(alignment: .leading){
                        HStack{
                            Text("Filled By: ")
                            Text(storedUser.user?.name ?? "")
                                .textCase(.uppercase)
                                .fontWeight(.bold)
                                .foregroundColor(.accent)
                        }
                        .padding(.bottom, 10)
                        HStack{
                           
                            Text("Emp ID: ")
                            if let formattedNum = formatter.string(from: NSNumber(value: number)){
                                Text(formattedNum)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.bottom, 10)
                        HStack{
                            Text("Aisle: ")
                            TextField("", text: $aisle)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .frame(maxWidth: 100)
                        }
                        
                      
                     
                        
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                    Spacer()

                    VStack(alignment: .leading){
                        HStack{
                            Text("Building: ")
                            Text(storedUser.user?.branchName ?? "")
                                .fontWeight(.bold)
                        }
                        .padding(.bottom, 10)
                        HStack{
                            Text("Date: ")
                            Text(pickerDate)
                                .fontWeight(.bold)
                        }
                        .padding(.bottom, 10)
                        
                        HStack{
                            Text("Time: ")
                            Text(pickerTime)
                                .fontWeight(.bold)
                        }
                        .padding(.bottom, 10)
                     
                    }
                    .padding(.top, 20)
                    
                    .padding(.horizontal,30)
                }
                .padding()
                
                .border(Color(dividerColor))
                
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.leading)
            Rectangle()
                .fill(Color(dividerColor))
                .frame(height: 2)
                .edgesIgnoringSafeArea(.horizontal)
     
            
            
            Spacer()
                .frame(height: 25)
        }
    }
}
//#Preview {
//    
//    AisleMaintenaceHeader()
//}
//struct ContentView_Previews: PreviewProvider {
//    @State static private var aisle: String = ""
//    
//    static var previews: some View {
//        AisleMaintenaceHeader(aisle: $aisle)
//    }
//}

