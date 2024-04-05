//
//  Page2Sec3.swift
//  GenTest
//
//  Created by Danny Castro on 3/28/24.
//

import SwiftUI

struct Page2Sec3: View {
    @Binding var branchChecklistPage2Model: BranchChecklistPage2Model
    
    let placeholder = "Comments..."
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Divider2()
                
                Text("Emergency Action Plan & Exit Doors")
                    .font(.headline)
                    .fontWeight(.bold)
                VStack(alignment: .leading){
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.meetForEmergency)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("All team members know where to meet in the case of an emergency")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.allExitsIlluminated)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("All exits are marked with an exit sign and is illuminated (Test all signs with battery backup monthly")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.exitSignBatteriesReplaced)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Exit signs requiring batteries to be replaced are identified on Fire Extinguisher Checklist")
                    }
                    .padding(.leading, 40)
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.exitDoorsOpenDirection)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Exit doors are able to open from the direction of exit travel without the use of any key or tool")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.freeFromObstruction)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("All exits are kept free of obstruction (Allow 36\" widefor pathway to exit at all times)")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.doorsSwingBothWays)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Doors that swing both directions between areas with frequent traffic are provided with viewing panels")
                    }
                    HStack(alignment: .top){
                        Toggle("", isOn: $branchChecklistPage2Model.notAnExit)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                            Text("Doors, Passageways, or Stairways that are NOT exits but could be mistaken for one are appropriately marked \"NOT AN EXIT\" or are labeled what they are, e.g. - \"STOREROOM\", \"ELECTRICAL\", etc.")
                    }
                    HStack{
                        Toggle("", isOn: $branchChecklistPage2Model.exitVisibleSigns)
                            .toggleStyle(Checkbox())
                            .font(.system(size: 25))
                        Text("Direction to Exits, if not immediately apparent, are marked with visible signs")
                    }
                }
                ZStack(alignment: .topLeading){
                    if branchChecklistPage2Model.page2sec3Comments.isEmpty {
                        Text(placeholder)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 10)
                    }
                    TextEditor(text: $branchChecklistPage2Model.page2sec3Comments)
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

//#Preview {
//    Page2Sec3()
//}
