//
//  Page1Sec1.swift
//  GenTest
//
//  Created by Danny Castro on 3/27/24.
//

import SwiftUI

struct Page1Sec1: View {
    @Binding var branchChecklistPage1Model: BranchChecklistPage1Model

    let placeholder = "Comments..."
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
             BCHeader()
               Divider2()
                
                Text("Employee Bullentin Board Posting")
                    .font(.headline)
                    .fontWeight(.bold)
                Text("Posting should be in an area accesible to all Team Members, (e.g. - lunch room, time clock station, tec.)")
                    .font(.caption)
                VStack(alignment: .leading){
                    HStack{
                        
                        Toggle("", isOn: $branchChecklistPage1Model.stateAndFederalLawPostersChecked)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        //                .padding()
                        Text("State and Federal Law Posters")
                        Spacer()
//                        HStack{
//                            Text("Date Posted")
//                            Spacer()
                        DatePicker("Date Posted", selection: $branchChecklistPage1Model.fedPosterDate, displayedComponents: .date)
                                .datePickerStyle(.compact)
                                .padding(.horizontal, 80)
                                .frame(maxWidth: .infinity, alignment: .leading)
//                        }
//                        .padding(.horizontal, 50)
//                        Text("8/24/2022")// NEDS TO BE A CALENDAR
                        Spacer()
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage1Model.osha300AChecked)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        //                .padding()
                        Text("OSHA 300A (Post Feb.1 - Apr. 30th. Keep last 5 years on file)")
                    }
                    HStack{
                        VStack(alignment: .leading){
                            HStack{
                                Toggle("", isOn: $branchChecklistPage1Model.emergencyTelephoneNumbersPostedChecked)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Emergency Telephone Numbers Posted")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage1Model.emergencyEvacuationPlanPostedChecked)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Emergency Evacuation Plan/Procedure Posted")
                            }
                        }
                      
                        Spacer()
                        VStack(alignment: .leading){
                            HStack{
                                Toggle("", isOn: $branchChecklistPage1Model.numbersEmployeesNotCurrentChecked)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Numbers/Employees NOT Current")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage1Model.layoutNotCurrentChecked)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Layout NOT Current")
                            }
                        }
                      
                    }
                   
                    ZStack(alignment: .topLeading){
                        if branchChecklistPage1Model.page1Sec1Comments.isEmpty {
                            Text(placeholder)
                                .foregroundColor(.gray)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 10)
                        }
                        TextEditor(text: $branchChecklistPage1Model.page1Sec1Comments)
                            .frame(height: 75)
                        
                        
                    }
                    .scrollContentBackground(.hidden)
                    .background(.ultraThinMaterial)
                    .padding(.horizontal, 30)
                    .padding(.top, 20)
//                    Spacer()
                }
                .padding(.trailing, 50)
                .padding(.top, 8)
               
//                Spacer()
            }//MAIN VSTACK
            .padding()
//            .border(Color.blue)
        }
    }
//    private let dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        formatter.timeStyle = .none
//        return formatter
//    }()
}

//#Preview {
//    Page1Sec1()
//}
//https://imgur.com/36OFTeQ

//HStack{
//    
//    HStack{
//        Toggle("", isOn: $isChecked)
//            .toggleStyle(Checkbox())
//            .font(.system(size: 25))
//        Text("Emergency Telephone Numbers Posted")
//    }
//    Spacer()
//    
//    HStack{
//        Toggle("", isOn: $isChecked)
//            .toggleStyle(Checkbox())
//            .font(.system(size: 25))
//        Text("Numbers/Employees NIT Current")
//    }
//    
//}
////                    .border(Color.red)
//HStack{
//    HStack{
//        Toggle("", isOn: $isChecked)
//            .toggleStyle(Checkbox())
//            .font(.system(size: 25))
//        Text("Emergency Evacuation Plan/Procedure Posted")
//    }
//    Spacer()
//    
//    HStack{
//        Toggle("", isOn: $isChecked)
//            .toggleStyle(Checkbox())
//            .font(.system(size: 25))
//        Text("Layout NOT Current")
//    }
//    
//    }
