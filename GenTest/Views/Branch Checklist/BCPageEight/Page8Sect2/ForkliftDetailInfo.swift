//
//  ForkliftDetailInfo.swift
//  GenTest
//
//  Created by Danny Castro on 4/4/24.
//

import SwiftUI


struct ForkliftDetailInfo: View {
    @Binding var assetInfo: ForkliftChecklistInfo
    @Binding var branchChecklistPage8Model: BranchChecklistPage8Model
    
    var body: some View {
        VStack {
            Text("Forklift Number: \(assetInfo.assetNumber)")
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
                        Toggle("", isOn: $assetInfo.seatbeltGood)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Seat belt is in good condition")
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
                        branchChecklistPage8Model.forkliftList[index] = assetInfo
                        
                    }
                    branchChecklistPage8Model.viewForkliftInfo = false
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
                    if let index = branchChecklistPage8Model.forkliftList.firstIndex(where: { $0.assetNumber == assetInfo.assetNumber }) {
                        branchChecklistPage8Model.forkliftList.remove(at: index)
                    }
                    branchChecklistPage8Model.viewForkliftInfo = false
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
