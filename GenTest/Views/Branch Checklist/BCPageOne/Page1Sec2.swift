//
//  Page1Sec2.swift
//  GenTest
//
//  Created by Danny Castro on 3/27/24.
//

import SwiftUI

struct Page1Sec2: View {
    @Binding var branchChecklistPage1Model: BranchChecklistPage1Model
    
    let placeholder = "Comments..."
    
    var body: some View {
       
        ZStack{
            VStack(alignment: .leading){
                Divider2()
                Text("Safety Posting & Documentation")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage1Model.safetyMinuts)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Monthly Safety Meeting Minutes (Keep last 12 months on file)")
                    }
                    HStack{
                        VStack(alignment: .leading){
                            HStack{
                                Toggle("", isOn: $branchChecklistPage1Model.fallProtection)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Fall Protection Plan Posted")
                            }
                            .padding(.bottom,2)
                            HStack{
                                Toggle("", isOn: $branchChecklistPage1Model.monthlySafetyMeeting)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Monthly Safety Meeting with ALL team members")
                            }
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            HStack{
                                Toggle("", isOn: $branchChecklistPage1Model.notCurrent)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Plan NOT Current")
                            }
                          
                            DatePicker("Date Posted", selection: $branchChecklistPage1Model.safetyMeetingDate, displayedComponents: .date)
                                .datePickerStyle(.compact)
//                                .padding(.bottom,2)
                        }
                        .frame(maxWidth: 250)
                        .padding(.trailing, 60)
//                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    }
                    
                    HStack{
                        Toggle("", isOn: $branchChecklistPage1Model.accidentPrevention)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Gensco's Safety and Accedent Prevention plan is available to all team members")
                    }
                    VStack(alignment: .leading){
                        HStack{
                            Toggle("", isOn: $branchChecklistPage1Model.tmKnowWHereLocation)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Team members know where it is located")
                            
                        }
                        HStack{
                            Toggle("", isOn: $branchChecklistPage1Model.tmReportUnsafeConditions)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Team members know to report an unsafe working condition")
                            
                        }
                    }
                    .padding(.horizontal,30)
                    
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage1Model.page1Sec2Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage1Model.page1Sec2Comments)
                        .frame(height: 75)
                    
                    
                }
                .scrollContentBackground(.hidden)
                .background(.ultraThinMaterial)
                .padding(.horizontal, 30)
                .padding(.top, 20)
//                Spacer()
            }//MAIN VSTACK
            .padding()
//            .border(Color.red)
        }
    }
}

//#Preview {
//    Page1Sec2()
//}
