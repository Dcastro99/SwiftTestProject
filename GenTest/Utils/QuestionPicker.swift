//
//  QuestionPicker.swift
//  GenTest
//
//  Created by Danny Castro on 3/15/24.
//

import SwiftUI

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

