
//
//  ForkliftDetailInfo.swift
//  GenTest
//
//  Created by Danny Castro on 4/4/24.
//

import SwiftUI


struct PickerDetailInfo: View {
    @Binding var assetInfo: PickerChecklistInfo
    @Binding var branchChecklistPage8Model: BranchChecklistPage8Model
    
    var body: some View {
        VStack {
            Text("Picker Number: \(assetInfo.assetNumber)")
                .font(.title)
                .fontWeight(.bold)
            Divider2()
            
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $assetInfo.inspectedDaily)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        
                        Text("Inspected Daily")
                    }
                    HStack{
                        Toggle("", isOn: $assetInfo.hornOperational)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Horn is operational")
                    }
                    HStack{
                        Toggle("", isOn: $assetInfo.laynardGood)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Lanyard is in good condition")
                    }
                    HStack{
                        Toggle("", isOn: $assetInfo.loadCapacityChart)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Load capacity chart is legible")
                    }
                    HStack{
                        Toggle("", isOn: $assetInfo.batteriesWatered)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Batteries are watered regularly")
                    }
                    HStack{
                        Toggle("", isOn: $assetInfo.appearanceGood)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Paint and appearance is in good condition")
                    }
                }
            }
            .padding(.top, 30)
            
            HStack{
                Button(action: {
                    if let index = branchChecklistPage8Model.forkliftList.firstIndex(where: { $0.assetNumber == assetInfo.assetNumber }) {
                        branchChecklistPage8Model.pickerList[index] = assetInfo
                        
                    }
                    branchChecklistPage8Model.viewPickerInfo = false
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
                    if let index = branchChecklistPage8Model.pickerList.firstIndex(where: { $0.assetNumber == assetInfo.assetNumber }) {
                        branchChecklistPage8Model.pickerList.remove(at: index)
                    }
                    branchChecklistPage8Model.viewPickerInfo = false
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






//#Preview {
//    ForkliftDetailInfo()
//}
