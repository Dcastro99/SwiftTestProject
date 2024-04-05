//
//  Page1Sec3.swift
//  GenTest
//
//  Created by Danny Castro on 3/28/24.
//

import SwiftUI

struct Page1Sec3: View {
    @Binding var branchChecklistPage1Model: BranchChecklistPage1Model
    
    var frequencyPicker = ["Monthly", "Quarterly", "Yearly"]
    let placeholder = "Comments..."
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Divider2()
                Text("First Aid & Medical Services")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage1Model.firstAidkitsAreEasilyAccessible)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("First Aid kits are easily accessible to each work are")
                    }
                    HStack{
                        VStack(alignment:.leading){
                            HStack{
                                Toggle("", isOn: $branchChecklistPage1Model.firstAidKitsAreStocked)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("First Aid kits are stocked with supplies")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage1Model.bloodBornePathogenKits)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Blood Borne Pathogen kits available (unopened)")
                            }
                        }
//                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        Spacer()
                        VStack(alignment:.leading){
                            HStack{
                                Toggle("", isOn: $branchChecklistPage1Model.expiredMedication)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("EXPIRED Medication/Supplies")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage1Model.replacementNeeded)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Needs to be replaced")
                            }
                        }
//                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .padding(.trailing,80)
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage1Model.eyewashStationPlacement)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Eye wash station(s) in areas where caustic / corrosive liquids/materials are handled")
                    }
                    Text("(Within a 10 second unobstructed walk)")
                        .font(.caption)
                        .italic()
                        .padding(.leading, 45)
                    HStack{
                        Toggle("", isOn: $branchChecklistPage1Model.eyewashStationService)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Eye wash station(s) are serviced regularly by a 3rd party")
                    }
                    HStack{
                        DatePicker("Date Posted", selection: $branchChecklistPage1Model.eyeWashDate, displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .frame(width: 250)
                        Spacer()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                      
                            HStack{
                                Text("Frequency of service")
                                Picker(selection: $branchChecklistPage1Model.frequency) {
                                    ForEach(0..<frequencyPicker.count, id: \.self) {
                                        Text(self.frequencyPicker[$0])
                                    }
                                } label: {
                                        Text("")
                                }
                            }
                    }
                    .padding(.horizontal,50)
                    HStack{
                        Toggle("", isOn: $branchChecklistPage1Model.k95Masks)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("KN95 masks are available for employees")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage1Model.page1Sec3Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage1Model.page1Sec3Comments)
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
//
//#Preview {
//    Page1Sec3()
//}
