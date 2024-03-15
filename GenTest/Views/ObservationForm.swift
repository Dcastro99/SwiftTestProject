//
//  ObservationForm.swift
//  GenTest
//
//  Created by Danny Castro on 3/13/24.
//

import SwiftUI

struct ObservationForm: View {
    @EnvironmentObject var storedUser: UserObs
    var tm = ["Banana","Apple", "Peach", "Watermelon", "Grapes" ]
    var questions = [
        "Did you lift properly?",
        "Did you follow safety protocols?",
        "Did you wear appropriate gear?"
    ]
    @State var notes: String = ""
    @State private var selectedTMIndex = 0
    @State var answer: Answers = .yes
    @State private var selectedAnswers: [Answers] = Array(repeating: .no, count: 3)
    let bgColor = #colorLiteral(red: 0.8131273912, green: 0.7377171282, blue: 0.578667129, alpha: 0.3209592301)
    
    
    var body: some View {
        let dateString = formatLongDate(from: Date())
        let timeString = formatTime(from: Date())
           
            ZStack{
                Color(bgColor)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Form{
                        
                        HStack {
                            
                            VStack{
                                Text("Today's Date: \(dateString)")
                                    .padding()
                                Text("Observation Form")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                
                                Divider()
                                
                                Spacer()
                                
                                HStack(alignment: .top){
                                    Spacer()
                                    
                                    VStack(alignment: .leading, spacing: 5){
                                       
                                        HStack{
                                            Text("Team Member Name: ")
                                            Menu {
                                                ForEach(0..<tm.count, id: \.self) { index in
                                                    Button(action: {
                                                        selectedTMIndex = index
                                                    }) {
                                                        Text(tm[index])
                                                    }
                                                }
                                            }
                                        label: {
                                            Text(tm[selectedTMIndex])
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
                                            Text("4")
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
            //                    .border(Color.red)
                                
            //                    Spacer()
                                //--------------SPACER RECTANGLE----------------//
                               Rectangle()
                                    .fill(.gray)
                                    .frame(height: 2)
                                    .edgesIgnoringSafeArea(.horizontal)
                                
                                TextEditor(text: $notes)
                                    .frame(height: 75)
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(10)
                                    .padding()
                                Spacer()
                                Text("Observation Questions")
                                    .font(.headline)
                                VStack(alignment: .leading) {
                                    
            //                        Spacer()
                                    ForEach(questions.indices, id: \.self) { index in
                                        QuestionPicker(question: questions[index], answer: $selectedAnswers[index])
                                        Divider()
                                    }
            //
                                   
                                }
                              
                                .padding()
                               
                                    
                            } // Main Vstack
                            .padding()
                            
            //                .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                           
                            
                            .padding(.horizontal,20)
                        }
                        
        //                .border(Color.black)
            //            .cornerRadius(8)
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
                        
                    }, label: {
                        Text("Submit")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding(.horizontal ,50)
                            .padding(.vertical,20)
                            .background(Color.black)
                            .cornerRadius(10)
                    })
                    .padding()
                    Spacer()
                }
            }
        
        }
    func resetSelectedAnswers() {
        selectedAnswers = Array(repeating: .no, count: 3)
        $notes.wrappedValue = ""
        selectedTMIndex = 0
    }
    
    func formatLongDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    func formatTime(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

}

#Preview {
    ObservationForm()
}


struct QuestionPicker: View {
    var question: String
    @Binding var answer: Answers
    
    var body: some View{
        
        Picker(selection: $answer) {
            Text("Yes").tag(Answers.yes)
            Text("No").tag(Answers.no)
        } label: {
            Text(question)
        }
    }
}


enum Answers: String {
    case yes = "Yes"
    case no = "No"
}
