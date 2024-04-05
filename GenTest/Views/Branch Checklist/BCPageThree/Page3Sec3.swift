//
//  Page3Sec3.swift
//  GenTest
//
//  Created by Danny Castro on 3/29/24.
//

import SwiftUI

struct Page3Sec3: View {
   @Binding var branchChecklistPage3Model: BranchChecklistPage3Model
   
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Divider2()
                
                Text("Compressed Gas $ Cylinders")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.cylinderLocation)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Cylinders located and/or stored in protected areas (covered from above)")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.cylinderTransportation)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Cylinders transported in amanner to prevent them from rolling, tipping, or falling")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.valveProtector)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Valve protector placed on cylinders when not in use (125 lbs cylinders)")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.gasStorage)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Acetylene and Oxygen cylinders MUST be stored a minimum of 20 feet apart")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.cylindersMarked)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("Cylinders legibly marked to clearly identify the contents as FULL or EMPTY")
                            }
                        }
                        VStack(alignment:.leading){
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.cylinderLocationNA)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("N/A")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.cylinderTransportationNA)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("N/A")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.valveProtectorNA)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("N/A")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.gasStorageNA)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("N/A")
                            }
                            HStack{
                                Toggle("", isOn: $branchChecklistPage3Model.cylindersMarkedNA)
                                    .toggleStyle(Checkbox())
                                    .font(.system(size: 25))
                                Text("N/A")
                            }
                        }
                        
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage3Model.page3sec3Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage3Model.page3sec3Comments)
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
