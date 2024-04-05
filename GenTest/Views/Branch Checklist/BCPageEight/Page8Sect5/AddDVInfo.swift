//
//  AddDVInfo.swift
//  GenTest
//
//  Created by Danny Castro on 4/5/24.
//

import SwiftUI

enum DVAlerts {
    case sameAssetNum
    case missingAssetNum
}

struct AddDVInfo: View {
    @Binding var branchChecklistPage8Model: BranchChecklistPage8Model
    @State private var alertType: DVAlerts? = nil
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
                    TextField("Enter Asset Number", text: $branchChecklistPage8Model.newDeliveryVehicleNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 100)
                    
                }
                .padding(.top, 20)
                HStack{
                    VStack(alignment: .leading) {
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.exteriorGood)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Exterior is in good condition")
                        }
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.windShieldGoodCondition)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Wind shield is free of cracks or chips")
                        }
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.slipResistant)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Bumpers and step downs are treated with slip-resistant tape or paint")
                        }
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.wideTurnStickers)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Wide turn stickers are on rear roll-up door")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.interiorGood)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Interior is in good condition and clean")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.registrationCurrent)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Current registration for vehicle")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.insuranceCurrent)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Current year's insurance information")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.dotUAFormL)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("DOT UA Chain of Custody form (CDL vehicles ONLY)")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.truckHeightSticker)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Truck box height sticker in cab")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.phoneMount)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Phone mount")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.dashCamConnected)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Dashcam connected and properly placed")
                        }
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.cellControlPresent)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Cell control present and connected")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.buckledStorage)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Buckled in storage")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.resQmeTool)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("ResQme tool")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.preTripCompleted)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Pre-trip inspections completed daily")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.hoursLoggedManually)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Hours of service log (Manually)")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.hoursLoggedELD)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Hours of service log (ELD)")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.fireExtinguisher)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Fire extinguisher present and checked monthly")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.firstAidKit)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("First aid kit")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.bloodBorneKit)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Blood borne pathogen kit (unused)")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.roadsidereflectors)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Emergency roadside reflectors")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.hardHat)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Hard hat")
                        }
                        
                        HStack{
                            Toggle("", isOn: $branchChecklistPage8Model.reflectiveVest)
                                .toggleStyle(Checkbox())
                                .font(.system(size: 25))
                            Text("Reflective vest")
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
            if branchChecklistPage8Model.DVList.contains(where: { $0.assetNumber == branchChecklistPage8Model.newDeliveryVehicleNumber }) {
                alertType = .sameAssetNum
                showAlert.toggle()
            }  else if branchChecklistPage8Model.newDeliveryVehicleNumber == "" {
                alertType = .missingAssetNum
                showAlert.toggle()
            }else {
                branchChecklistPage8Model.DVList.append(DeliveryVehiclesChecklistInfo(assetNumber: branchChecklistPage8Model.newDeliveryVehicleNumber, exteriorGood: branchChecklistPage8Model.exteriorGood, windShieldGoodCondition: branchChecklistPage8Model.windShieldGoodCondition, slipResistant: branchChecklistPage8Model.slipResistant, wideTurnStickers: branchChecklistPage8Model.wideTurnStickers, interiorGood: branchChecklistPage8Model.interiorGood, registrationCurrent: branchChecklistPage8Model.registrationCurrent, insuranceCurrent: branchChecklistPage8Model.insuranceCurrent, dotUAFormL: branchChecklistPage8Model.dotUAFormL, truckHeightSticker: branchChecklistPage8Model.truckHeightSticker, phoneMount: branchChecklistPage8Model.phoneMount, dashCamConnected: branchChecklistPage8Model.dashCamConnected, cellControlPresent: branchChecklistPage8Model.cellControlPresent, buckledStorage: branchChecklistPage8Model.buckledStorage, resQmeTool: branchChecklistPage8Model.resQmeTool, preTripCompleted: branchChecklistPage8Model.preTripCompleted, hoursLoggedManually: branchChecklistPage8Model.hoursLoggedManually, hoursLoggedELD: branchChecklistPage8Model.hoursLoggedELD, fireExtinguisher: branchChecklistPage8Model.fireExtinguisher, firstAidKit: branchChecklistPage8Model.firstAidKit, bloodBorneKit: branchChecklistPage8Model.bloodBorneKit, roadsidereflectors: branchChecklistPage8Model.roadsidereflectors, hardHat: branchChecklistPage8Model.hardHat, reflectiveVest: branchChecklistPage8Model.reflectiveVest))
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
        branchChecklistPage8Model.isAddingDV = false
        branchChecklistPage8Model.newDeliveryVehicleNumber = ""
        branchChecklistPage8Model.exteriorGood = false
        branchChecklistPage8Model.windShieldGoodCondition = false
        branchChecklistPage8Model.slipResistant = false
        branchChecklistPage8Model.wideTurnStickers = false
        branchChecklistPage8Model.interiorGood = false
        branchChecklistPage8Model.registrationCurrent = false
        branchChecklistPage8Model.dotUAFormL = false
        branchChecklistPage8Model.truckHeightSticker = false
        branchChecklistPage8Model.phoneMount = false
        branchChecklistPage8Model.dashCamConnected = false
        branchChecklistPage8Model.cellControlPresent = false
        branchChecklistPage8Model.buckledStorage = false
        branchChecklistPage8Model.resQmeTool = false
        branchChecklistPage8Model.preTripCompleted = false
        branchChecklistPage8Model.hoursLoggedManually = false
        branchChecklistPage8Model.hoursLoggedELD = false
        branchChecklistPage8Model.fireExtinguisher = false
        branchChecklistPage8Model.firstAidKit = false
        branchChecklistPage8Model.bloodBorneKit = false
        branchChecklistPage8Model.roadsidereflectors = false
        branchChecklistPage8Model.hardHat = false
        branchChecklistPage8Model.reflectiveVest = false
    }
    
    func getAlert() -> Alert{
        switch alertType {
        case .sameAssetNum:
            return  Alert(title: Text("Asset Already Added"), message: Text("The asset number \(branchChecklistPage8Model.newDeliveryVehicleNumber) is already in the list."), dismissButton: .default(Text("OK")))
        case .missingAssetNum:
            return  Alert(title: Text("Asset Number Missing"), message: Text("Please enter an Asset number."), dismissButton: .default(Text("OK")))
        default:
            return Alert(title: Text("Error"))
        }
    }
}
