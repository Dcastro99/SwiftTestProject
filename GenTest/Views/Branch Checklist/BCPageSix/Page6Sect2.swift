//
//  Page6Sect2.swift
//  GenTest
//
//  Created by Danny Castro on 4/2/24.
//

import SwiftUI

struct Page6Sect2: View {
    @Binding var branchChecklistPage6Model: BranchChecklistPage6Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Divider2()
                
                Text("Marketing")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment:.leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.literatureOrganized)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Literature wall/section is organized and stock is replenished regularly")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.equipmentDisplayClean)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Equipment display is clean, appealing, and containing relevant literature for the display")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.supplyDisplayClean)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Supplies display is clean, appealing, and containing relevant literature for the display")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.catalogsProvided)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Gensco catalogs are readily available to customers")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.monthlyChronicleDisplayed)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Monthly chronicle is displayed in a neat orderly fashion, and is current")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage6Model.oldBannersRemoved)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Old banners, displays, and clutter are not present in the showroom")
                    }
                    
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage6Model.page6sec2Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage6Model.page6sec2Comments)
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
