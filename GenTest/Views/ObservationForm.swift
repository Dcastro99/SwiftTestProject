//
//  ObservationForm.swift
//  GenTest
//
//  Created by Danny Castro on 3/13/24.
//

import SwiftUI

struct ObservationForm: View {
    @EnvironmentObject var storedUser: UserObs
    
    @AppStorage("token") var userToken: String?
  
    @State private var users: [GetAllUsersModel]?
    @State private var selectedTMIndex = 0
    @State private var selectedAnswers: [Answers] = Array(repeating: .no, count: 3)
    @State var answer: Answers = .yes
    @State var notes: String = ""
   
    var questions = [
        "Did you lift properly?",
        "Did you follow safety protocols?",
        "Did you wear appropriate gear?"
    ]
    let bgColor = #colorLiteral(red: 0.8131273912, green: 0.7377171282, blue: 0.578667129, alpha: 0.3209592301)
    let mainBG = #colorLiteral(red: 0.9914150834, green: 0.9771276116, blue: 0.9294666648, alpha: 1)
    
    // MARK: BODY
    var body: some View {
        let placeholder = "Enter notes here..."
        let currentDateTime = Date()
        let dateString = formatLongDate(from: currentDateTime)
        let timeString = formatTime(from: Date())
           
            ZStack{
                Color(mainBG)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Form{
                        
                        HStack {
                            
                            VStack{
                              
                                  
                                Text("Observation Form")
                                    .font(.title)
                                    .fontWeight(.bold)
                                
                                Divider()
                                    .background(Color.gray)
                                    .padding(.horizontal,100)
                                
                                Spacer()
                                
                                HStack(alignment: .top){
                                    Spacer()
                                    
                                    VStack(alignment: .leading, spacing: 5){
                                       
                                        HStack{
                                            Text("Team Member Name: ")
                                            Menu {
                                                
                                                ForEach(0..<(users?.count ?? 0), id: \.self) {
                                                    index in
                                                    Button(action: {
                                                        selectedTMIndex = index
                                                    }) {
                                                        Text(users?[index].name ?? "Unknown")
                                                    }
                                                }
                                            } label: {
                                                Text(users?[selectedTMIndex].name ?? "Select Team Member")
                                                    .fontWeight(.bold)
                                            }
                                            
                                            Spacer()
                                        }
                                        .frame(width: UIScreen.main.bounds.width * 0.4)
            //                            .border(Color.cyan)
                                        
                                        HStack{
                                            Text("Filled By: ")
                                            Text(storedUser.user?.name ?? "user")
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
                                            Text("\(storedUser.user?.branchId ?? 0 )")
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
                                .padding()

                                //--------------SPACER RECTANGLE----------------//
                               Rectangle()
                                    .fill(.gray)
                                    .frame(height: 3)
                                    .edgesIgnoringSafeArea(.horizontal)
                                
                                ZStack(alignment: .topLeading){
                                    if notes.isEmpty {
                                        Text(placeholder)
                                            .foregroundColor(.gray)
                                            .padding(.horizontal, 20)
                                            .padding(.vertical, 25)
                                    }
                                    TextEditor(text: $notes)
                                        .frame(height: 75)
                                        
                                        .cornerRadius(10)
                                        .padding()
                                        .padding(.top,30)
                                }
                                .background(.ultraThinMaterial)
                                .padding(.top,50)
                                Spacer()
                                Text("Observation Questions")
                                    .font(.headline)
                                VStack(alignment: .leading) {
                                    
                                    ForEach(questions.indices, id: \.self) { index in
                                        QuestionPicker(question: questions[index], answer: $selectedAnswers[index])
                                        Divider()
                                    }
                                   
                                }
                              
                                .padding()
                               
                                    
                            } // Main Vstack
                            .padding()
                            .padding(.horizontal,20)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .scrollDisabled(true)
                 
                    .pickerStyle(.menu)
                    Spacer()
                    Button(action: {
                        for (index, answer) in selectedAnswers.enumerated() {
                            print("Question: \(questions[index]), Answer: \(answer.rawValue)")
                            resetSelectedAnswers()
                        }
                        print("notes: \(notes)")
                    print("Current Time: \(currentDateTime)")
                        
                    }, label: {
                        Text("Submit")
                            .font(.title)
                            .foregroundStyle(Color.accentColor)
                            .padding(.horizontal ,50)
                            .padding(.vertical,20)
                            .background(Color.black)
                            .cornerRadius(10)
                    })
                    .padding()
                    Spacer()
                }
            }
            .onAppear{
                Task {
                    do {
                        users = try await GetAllUsers(token: userToken, id: storedUser.user?.branchId ?? 0)
                       
                        users = users?.filter { $0.role != 1 && $0.role != 2 && $0.role != 3 }
                      
                    }
                }
            }
        
        }
    // MARK: FUNCTIONS
    
    func resetSelectedAnswers() {
        selectedAnswers = Array(repeating: .no, count: 3)
        $notes.wrappedValue = ""
        selectedTMIndex = 0
    }
    
}

#Preview {
    ObservationForm()
}


