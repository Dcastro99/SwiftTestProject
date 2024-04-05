//
//  OtherEquipDetailInfo.swift
//  GenTest
//
//  Created by Danny Castro on 4/5/24.
//

import SwiftUI

struct OtherEquipDetailInfo: View {
    @Binding var assetInfo: OtherEquipChecklistInfo
    @Binding var branchChecklistPage8Model: BranchChecklistPage8Model
    
    var body: some View {
        VStack {
            Text("Other Equipment Number: \(assetInfo.assetNumber)")
                .font(.title)
                .fontWeight(.bold)
            Divider2()
            
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $assetInfo.inspectedRegularly)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        
                        Text("Inspected regularly")
                    }
                    HStack{
                        Toggle("", isOn: $assetInfo.maintainedRegularly)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Maintained regulalry")
                    }
                    HStack{
                        Toggle("", isOn: $assetInfo.appearanceGood)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Appearance is in good condition")
                    }
                }
            }
            .padding(.top, 30)
            
            HStack{
                Button(action: {
                    if let index = branchChecklistPage8Model.otherEquipList.firstIndex(where: { $0.assetNumber == assetInfo.assetNumber }) {
                        branchChecklistPage8Model.otherEquipList[index] = assetInfo
                        
                    }
                    branchChecklistPage8Model.viewOtherEquipInfo = false
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
                    if let index = branchChecklistPage8Model.otherEquipList.firstIndex(where: { $0.assetNumber == assetInfo.assetNumber }) {
                        branchChecklistPage8Model.otherEquipList.remove(at: index)
                    }
                    branchChecklistPage8Model.viewOtherEquipInfo = false
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
