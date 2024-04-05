//
//  AddOtherEquipInfo.swift
//  GenTest
//
//  Created by Danny Castro on 4/5/24.
//

import SwiftUI

enum OtherEquipAlerts {
    case sameAssetNum
    case missingAssetNum
}

struct AddOtherEquipInfo: View {
    @Binding var branchChecklistPage8Model: BranchChecklistPage8Model
    @State private var alertType: OtherEquipAlerts? = nil
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
                    TextField("Enter Asset Number", text: $branchChecklistPage8Model.newEquipNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100)
                    
                }
                .padding(.top, 20)
                HStack{
                    VStack(alignment: .leading) {
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.inspectedRegularly)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Inspected Regularly")
                        }
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.maintainedRegularly)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Inspected Regularly")
                        }
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.appearanceGood)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Appearance is in good condition")
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
            if branchChecklistPage8Model.pickerList.contains(where: { $0.assetNumber == branchChecklistPage8Model.newEquipNumber }) {
                alertType = .sameAssetNum
                showAlert.toggle()
            }  else if branchChecklistPage8Model.newEquipNumber == "" {
                alertType = .missingAssetNum
                showAlert.toggle()
            }else {
                branchChecklistPage8Model.otherEquipList.append(OtherEquipChecklistInfo(assetNumber: branchChecklistPage8Model.newEquipNumber, inspectedRegularly: branchChecklistPage8Model.inspectedRegularly, maintainedRegularly: branchChecklistPage8Model.maintainedRegularly, appearanceGood: branchChecklistPage8Model.appearanceGood))
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
        branchChecklistPage8Model.isAddingOtherEquip = false
        branchChecklistPage8Model.newEquipNumber = ""
        branchChecklistPage8Model.inspectedRegularly = false
        branchChecklistPage8Model.maintainedRegularly = false
        branchChecklistPage8Model.appearanceGood = false
    }
    
    func getAlert() -> Alert{
        switch alertType {
        case .sameAssetNum:
            return  Alert(title: Text("Asset Already Added"), message: Text("The asset number \(branchChecklistPage8Model.newEquipNumber) is already in the list."), dismissButton: .default(Text("OK")))
        case .missingAssetNum:
            return  Alert(title: Text("Asset Number Missing"), message: Text("Please enter an Asset number."), dismissButton: .default(Text("OK")))
        default:
            return Alert(title: Text("Error"))
        }
    }
}
