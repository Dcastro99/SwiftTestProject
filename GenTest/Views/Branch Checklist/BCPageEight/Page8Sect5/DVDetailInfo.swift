//
//  DVDetailInfo.swift
//  GenTest
//
//  Created by Danny Castro on 4/5/24.
//

import SwiftUI

struct DVDetailInfo: View {
    @Binding var assetInfo: DeliveryVehiclesChecklistInfo
    @Binding var branchChecklistPage8Model: BranchChecklistPage8Model
    
    var body: some View {
        VStack {
            Text("Delivery Vehicle Number: \(assetInfo.assetNumber)")
                .font(.title)
                .fontWeight(.bold)
            Divider2()
            
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $assetInfo.exteriorGood)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Exterior is in good condition")
                    }
                    HStack{
                        Toggle("", isOn: $assetInfo.windShieldGoodCondition)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Wind shield is free of cracks or chips")
                    }
                    HStack{
                        Toggle("", isOn: $assetInfo.slipResistant)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Bumpers and step downs are treated with slip-resistant tape or paint")
                    }
                    HStack{
                        Toggle("", isOn: $assetInfo.wideTurnStickers)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Wide turn stickers are on rear roll-up door")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.interiorGood)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Interior is in good condition and clean")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.registrationCurrent)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Current registration for vehicle")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.insuranceCurrent)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Current year's insurance information")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.dotUAFormL)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("DOT UA Chain of Custody form (CDL vehicles ONLY)")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.truckHeightSticker)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Truck box height sticker in cab")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.phoneMount)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Phone mount")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.dashCamConnected)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Dashcam connected and properly placed")
                    }
                    HStack{
                        Toggle("", isOn: $assetInfo.cellControlPresent)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Cell control present and connected")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.buckledStorage)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Buckled in storage")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.resQmeTool)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("ResQme tool")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.preTripCompleted)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Pre-trip inspections completed daily")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.hoursLoggedManually)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Hours of service log (Manually)")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.hoursLoggedELD)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Hours of service log (ELD)")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.fireExtinguisher)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Fire extinguisher present and checked monthly")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.firstAidKit)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("First aid kit")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.bloodBorneKit)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Blood borne pathogen kit (unused)")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.roadsidereflectors)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Emergency roadside reflectors")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.hardHat)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Hard hat")
                    }
                    
                    HStack{
                        Toggle("", isOn: $assetInfo.reflectiveVest)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Reflective vest")
                    }
                }
            }
            .padding(.top, 30)
            
            HStack{
                Button(action: {
                    if let index = branchChecklistPage8Model.DVList.firstIndex(where: { $0.assetNumber == assetInfo.assetNumber }) {
                        branchChecklistPage8Model.DVList[index] = assetInfo
                        
                    }
                    branchChecklistPage8Model.viewDVInfo = false
                }) {
                    Text("Update")
                        .font(.headline)
                        .foregroundStyle(Color.accentColor)
                        .padding(.horizontal ,15)
                        .padding(.vertical,10)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                Button(action: {
                    if let index = branchChecklistPage8Model.DVList.firstIndex(where: { $0.assetNumber == assetInfo.assetNumber }) {
                        branchChecklistPage8Model.DVList.remove(at: index)
                    }
                    branchChecklistPage8Model.viewDVInfo = false
                }) {
                    Text("Remove Asset")
                        .font(.headline)
                        .foregroundStyle(Color.black)
                        .padding(.horizontal ,15)
                        .padding(.vertical,10)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                
            }
            .padding(.top, 60)
            Spacer()
        }//MAIN VSTACK
        .padding()
    }
}
