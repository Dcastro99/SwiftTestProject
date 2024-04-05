//
//  AddForkliftInfo.swift
//  GenTest
//
//  Created by Danny Castro on 4/4/24.
//

import SwiftUI

enum ForkliftAlerts {
    case sameAssetNum
    case missingAssetNum
}

struct AddForkliftInfo: View {
    @Binding var branchChecklistPage8Model: BranchChecklistPage8Model
    @State private var alertType: ForkliftAlerts? = nil
    @State private var showAlert = false
    
    var body: some View{
        VStack {
            VStack(alignment: .leading) {
                
                Text("Asset Information")
                    .font(.title)
                    .fontWeight(.bold)
                Divider2()
                HStack{
                    Text("Asset number: ")
                    TextField("Enter Asset Number", text: $branchChecklistPage8Model.newForkliftNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100)
                    
                }
                .padding(.top, 20)
                HStack{
                    VStack(alignment: .leading) {
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.inspectedDaily)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Inspected Daily")
                        }
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.hornOperational)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Horn is operational")
                        }
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.seatbeltGood)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Seat belt is in good condition")
                        }
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.loadCapacityChart)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Load capacity chart is legible")
                        }
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.batteriesWatered)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Batteries are watered regularly")
                        }
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.appearanceGood)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Paint and appearance is in good condition")
                        }
                        
                    }
                    .padding()
                    
                    Spacer()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                )
                
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        Spacer()
        
        Button(action: {
            //
            if branchChecklistPage8Model.forkliftList.contains(where: { $0.assetNumber == branchChecklistPage8Model.newForkliftNumber }) {
                alertType = .sameAssetNum
                showAlert.toggle()
            }  else if branchChecklistPage8Model.newForkliftNumber == "" {
                alertType = .missingAssetNum
                showAlert.toggle()
            }else {
                branchChecklistPage8Model.forkliftList.append(ForkliftChecklistInfo(assetNumber: branchChecklistPage8Model.newForkliftNumber, inspectedDaily: branchChecklistPage8Model.inspectedDaily, hornOperational: branchChecklistPage8Model.hornOperational, seatbeltGood: branchChecklistPage8Model.seatbeltGood, loadCapacityChart: branchChecklistPage8Model.loadCapacityChart, batteriesWatered: branchChecklistPage8Model.batteriesWatered, appearanceGood: branchChecklistPage8Model.appearanceGood))
                clearFields()
            }
        }, label: {
            Text("Add Asset")
                .font(.title)
                .foregroundStyle(Color.accentColor)
                .padding(.horizontal ,25)
                .padding(.vertical,10)
                .background(Color.black)
                .cornerRadius(10)
        })
        .padding(.bottom, 40)
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    //MARK: FUNCTIONS
    func clearFields() {
        branchChecklistPage8Model.isAddingForklift = false
        branchChecklistPage8Model.newForkliftNumber = ""
        branchChecklistPage8Model.inspectedDaily = false
        branchChecklistPage8Model.hornOperational = false
        branchChecklistPage8Model.seatbeltGood = false
        branchChecklistPage8Model.loadCapacityChart = false
        branchChecklistPage8Model.batteriesWatered = false
        branchChecklistPage8Model.appearanceGood = false
    }
    
    func getAlert() -> Alert{
        switch alertType {
        case .sameAssetNum:
            return  Alert(title: Text("Asset Already Added"), message: Text("The asset number \(branchChecklistPage8Model.newForkliftNumber) is already in the list."), dismissButton: .default(Text("OK")))
        case .missingAssetNum:
            return  Alert(title: Text("Asset Number Missing"), message: Text("Please enter an Asset number."), dismissButton: .default(Text("OK")))
        default:
            return Alert(title: Text("Error"))
        }
    }
}
