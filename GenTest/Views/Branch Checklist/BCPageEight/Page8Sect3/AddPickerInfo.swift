//
//  AddPickerInfo.swift
//  GenTest
//
//  Created by Danny Castro on 4/5/24.
//

import SwiftUI

enum PickerAlerts {
    case sameAssetNum
    case missingAssetNum
}

struct AddPickerInfo: View {
    @Binding var branchChecklistPage8Model: BranchChecklistPage8Model
    @State private var alertType: PickerAlerts? = nil
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
                    TextField("Enter Asset Number", text: $branchChecklistPage8Model.newPickerNumber)
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
                            Toggle("", isOn: $branchChecklistPage8Model.laynardGood)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Lanyard is in good condition")
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
            if branchChecklistPage8Model.pickerList.contains(where: { $0.assetNumber == branchChecklistPage8Model.newPickerNumber }) {
                alertType = .sameAssetNum
                showAlert.toggle()
            }  else if branchChecklistPage8Model.newPickerNumber == "" {
                alertType = .missingAssetNum
                showAlert.toggle()
            }else {
                branchChecklistPage8Model.pickerList.append(PickerChecklistInfo(assetNumber: branchChecklistPage8Model.newPickerNumber, inspectedDaily: branchChecklistPage8Model.inspectedDaily, hornOperational: branchChecklistPage8Model.hornOperational, laynardGood: branchChecklistPage8Model.laynardGood, loadCapacityChart: branchChecklistPage8Model.loadCapacityChart, batteriesWatered: branchChecklistPage8Model.batteriesWatered, appearanceGood: branchChecklistPage8Model.appearanceGood))
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
        branchChecklistPage8Model.isAddingPicker = false
        branchChecklistPage8Model.newPickerNumber = ""
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
            return  Alert(title: Text("Asset Already Added"), message: Text("The asset number \(branchChecklistPage8Model.newPickerNumber) is already in the list."), dismissButton: .default(Text("OK")))
        case .missingAssetNum:
            return  Alert(title: Text("Asset Number Missing"), message: Text("Please enter an Asset number."), dismissButton: .default(Text("OK")))
        default:
            return Alert(title: Text("Error"))
        }
    }
}
