//
//  SaferBuckForms.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//

import SwiftUI

struct SaferBuckForms: View {
    var users = ["name": "yoshi"]
    @State private var selectedTMIndex = 0
    @State private var notes = ""
    let placeholder = "Reason..."
    var sbPhoto = URL(string:"https://i.imgur.com/JNWm2GJ.png")
    let mainBG = #colorLiteral(red: 0.9914150834, green: 0.9771276116, blue: 0.9294666648, alpha: 1)
//    let mainBG = Color.black
    let borderColor = #colorLiteral(red: 0.8273920405, green: 0.8159203832, blue: 0.7815054113, alpha: 1)
    let shadowColor = #colorLiteral(red: 0.6219815341, green: 0.4516383971, blue: 0.2538724373, alpha: 0.2968232616)
    var body: some View {
        let currentDateTime = Date()
        let dateString = formatLongDate(from: currentDateTime)
        let timeString = formatTime(from: Date())
        ZStack{
            Color(mainBG).ignoresSafeArea(.all)
            VStack(spacing:10){
             
                AsyncImage(url: sbPhoto) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Rectangle())
                        .frame(  maxWidth: 300, maxHeight: 150)
                        .shadow(color:Color(shadowColor),radius: 5, x: 3, y: 8)
                    
                }
                
            placeholder: {
                ProgressView()
            }
//                Form{
                    
                    VStack{
                      
                        Text("Safer Bucks Form")
                            .font(.largeTitle)
                            .foregroundStyle(Color.accentColor)
                        
                        HStack(alignment: .top){
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 5){
                                
                                HStack{
                                    Text("Team Member Name: ")
//                                    Menu {
                                        
//                                        ForEach(0..<(users?.count ?? 0), id: \.self) {
//                                            index in
//                                            Button(action: {
//                                                selectedTMIndex = index
//                                            }) {
//                                                Text(users?[index].name ?? "Unknown")
//                                            }
//                                        }
//                                    } label: {
//                                        Text(users?[selectedTMIndex].name ?? "Select Team Member")
//                                            .fontWeight(.bold)
//                                    }
                                    
                                    Spacer()
                                }
                                .frame(width: UIScreen.main.bounds.width * 0.4)
                                //                            .border(Color.cyan)
                                Spacer().frame(height: 20)
                                HStack{
                                    Text("Filled By: ")
                                  
                                    Text( "user")
                                        .fontWeight(.bold)
                                }
                                
                            }
                            //                        .border(Color.green)
                            
                            Spacer()
                            
                            VStack(alignment: .leading,spacing:5){
                                HStack{
                                    Text("Date: ")
                                    Text(dateString)
                                        .fontWeight(.bold)
                                }
                                HStack{
                                    Text("Branch")
                                    Text(" 0 ")
                                        .fontWeight(.bold)
                                }
                                HStack{
                                    Text("Time: ")
                                    Text(timeString)
                                        .fontWeight(.bold)
                                }
                                
                            }
                            //                        .border(Color.black)
                            
                            Spacer()
                        }
                        .padding(.vertical,25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(borderColor), lineWidth: 1)
                                .padding(.horizontal,35)
                                
                        )
                        
                        Spacer().frame(height: 25)
                        
                       
                        VStack{
                            
                            ZStack(alignment: .topLeading){
                                if notes.isEmpty {
                                    Text(placeholder)
                                        .foregroundColor(.gray)
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, 10)
                                }
                                TextEditor(text: $notes)
                                    .frame(height: 75)
                                    
                                    
                            }
                            .scrollContentBackground(.hidden)
                            .background(.ultraThinMaterial)
                            .padding(.horizontal, 30)
                            .padding(.top, 20)
                            Text("Safer Points")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .padding(.vertical, 30)
                               Divider()
                            HStack {
//                                Text("Points")
//                                    .font(Font.headline)
                                RadioButtonGroups { selected in
                                    print("Points selected is: \(selected)")
                                }
                                .padding()
//                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white)
                                .shadow(radius: 8, x: 3, y: 10)
//
                        )
                     
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Submit")
                                .font(.title)
                                .foregroundStyle(Color.accentColor)
                            //                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding(.horizontal ,50)
                                .padding(.vertical,20)
                                .background(Color.black)
                                .cornerRadius(10)
                        })
                        .padding(.top,50)
                     
                    }
                    .padding(.horizontal, 50)
                    .padding(.vertical, 20)
//                    .listRowBackground(Color.clear)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .overlay(
                                
                                Rectangle()
                                   
                                    .stroke(Color(borderColor), lineWidth: 1)
                            )
                    )
                   
               
//                }
//                
//                .scrollContentBackground(.hidden)
//                .scrollDisabled(true)
//               
//                .pickerStyle(.menu)
               
          
              
                
                Spacer()
            }//VSTACK
            .padding(30)
           
        }
        
    }
    // MARK: FUNCTIONS
    
   
    
//    func formatLongDate(from date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        formatter.timeStyle = .none
//        return formatter.string(from: date)
//    }
//    func formatTime(from date: Date) -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .none
//        formatter.timeStyle = .short
//        return formatter.string(from: date)
//    }
}

#Preview {
    SaferBuckForms()
}
