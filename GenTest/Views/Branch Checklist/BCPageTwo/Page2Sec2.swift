//
//  Page2Sec2.swift
//  GenTest
//
//  Created by Danny Castro on 3/28/24.
//

import SwiftUI

struct Page2Sec2: View {
    @Binding var branchChecklistPage2Model: BranchChecklistPage2Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment:.leading){
                Divider2()
                
                Text("Fire Protection")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        VStack{
                            HStack{
                                Toggle("", isOn: $branchChecklistPage2Model.fireAlarmMaintained)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Fire Alarm system properly maintained and tested regularly")
                            }
                        }
                        Spacer()
                        VStack{
                            DatePicker("Date Tested:", selection: $branchChecklistPage2Model.fireAlarmDate, displayedComponents: .date)
                                .datePickerStyle(.compact)
                                
                        }
                        .frame(maxWidth: 250)
                    }
                    HStack{
                        VStack{
                            HStack{
                                Toggle("", isOn: $branchChecklistPage2Model.sprinklerSystemTested)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Sprinkler System tested annually (Sprinkler Riser)")
                            }
                        }
                        Spacer()
                        VStack{
                            DatePicker("Date Tested:", selection: $branchChecklistPage2Model.sprinklerTestDate, displayedComponents: .date)
                                .datePickerStyle(.compact)
                            
                        }
                        .frame(maxWidth: 250)
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.sprinklerHeadProtection)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Sprinkler heads protected by metal guards when exposed to potential physical damage")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.sprinklerClearance)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Proper clearance maintained below sprinkler heads (Minimum clearance of 18)")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.fireExtinguisherLocations)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Fire Extinguishers located in readily accessible locations and properly marked")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.fireExtinguisherInspected)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Fire Extinguishers inspected monthly (Initial and date the tag at inspection)")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.notInspected)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Fire Extinguishers NOT inspected are identified on Fire Extinguisher Cheklist")
                    }
                    .padding(.leading,40)
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.defectiveExtinguishersReplaced)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Defective Fire Extiguishers are removed and replaced immediately")
                    }
                    HStack{
                        VStack{
                            HStack{
                                Toggle("", isOn: $branchChecklistPage2Model.securityAlarmChecked)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Security Alarm maintained regularly")
                            }
                        }
                        Spacer()
                        HStack{
                            Toggle("", isOn: $branchChecklistPage2Model.notApplicable)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("N/A")
                        }
                        Spacer()
                        VStack{
                            DatePicker("Date Tested:", selection: $branchChecklistPage2Model.sprinklerTestDate, displayedComponents: .date)
                                .datePickerStyle(.compact)
                            
                        }
                        .frame(maxWidth: 250)
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage2Model.page2sec2Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage2Model.page2sec2Comments)
                        .frame(height: 75)
                    
                    
                }
                .scrollContentBackground(.hidden)
                .background(.ultraThinMaterial)
                .padding(.horizontal, 30)
                .padding(.top, 20)
            }//MAIN VSTACK
            .padding()
           
        }
    }
}

//#Preview {
//    Page2Sec2()
//}
