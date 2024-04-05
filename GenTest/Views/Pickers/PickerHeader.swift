//
//  PickerHeader.swift
//  GenTest
//
//  Created by Danny Castro on 3/21/24.
//

import SwiftUI

let data = [
 "Gas",
 "Electric"
]

struct PickerHeader: View {
    @EnvironmentObject var storedUser: UserObs
    @Binding var status: String
    @Binding var selectedNames: Set<String>
    @Binding var odometer: String 
    @State var buttonClicked: Int?
    let pickerInfo: AssetModel
    let dividerColor = #colorLiteral(red: 0.7836529594, green: 0.7627409962, blue: 0.7736164322, alpha: 0.5)
    
    var body: some View {
        let currentDateTime = Date()
        let pickerDate = formatLongDate(from: currentDateTime)
        let pickerTime = formatTime(from: Date())
        VStack(alignment: .leading){
            let url = URL(string: pickerInfo.image)
            HStack(alignment: .top){
                AsyncImage(url: url) { phase in
                    switch phase {
                    case.empty:
                        ProgressView()
                    case.success(let returnImage):
                        
                        returnImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minWidth: 20, idealWidth: 20, maxWidth: 100, minHeight: 20, idealHeight: 20, maxHeight: 150)
                            .background(.clear)
                    case.failure:
                        VStack(spacing:20){
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.system(size: 100))
                            
                            Text("No image found!")
                                .font(.title)
                        }
                        
                    default:
                        Image(systemName: "questionmark")
                            .font(.title)
                    }
                }
//                .padding(.leading)
                Spacer()
                HStack(alignment:.top){
                    VStack(alignment: .leading){
                        HStack{
                            Text("Filled By: ")
                            Text(storedUser.user?.name ?? "")
                                .textCase(.uppercase)
                                .fontWeight(.bold)
                                .foregroundColor(.accent)
                        }
                        .padding(.bottom, 10)
                        HStack{
                            Text("Asset: ")
                            Text(pickerInfo.assetNum)
                                .fontWeight(.bold)
                        }
                        
                     
                        HStack {
                            VStack(alignment: .leading) {
                                ForEach(data.prefix(data.count / 2), id: \.self) { name in
                                    HStack {
                                        Toggle("", isOn: Binding(
                                            get: {selectedNames.contains(name) },
                                            set: { isChecked in
                                                if isChecked {
                                                        selectedNames = [name]
                                                } else {
                                                    selectedNames = []
//                                                    selectedNames.remove(name)
                                                }
                                            }
                                        ))
                                        .toggleStyle(Checkbox())
                                        .font(.system(size: 25))
                                        Text(name)
                                    }
                                    .padding(.vertical, 5)
                            
                                }
                            }

                            VStack(alignment: .leading) {
                                ForEach(data.suffix(data.count / 2), id: \.self) { name in
                                    HStack {
                                        Toggle("", isOn: Binding(
                                            get: { selectedNames.contains(name) },
                                            set: { isChecked in
                                                if isChecked {
                                                    selectedNames = [name]
                                                } else {
                                                    selectedNames = []
//                                                   selectedNames.remove(name)
                                                }
                                                //                                printSelectedNames()
                                            }
                                        ))
                                        .toggleStyle(Checkbox())
                                        .font(.system(size: 25))
                                        Text(name)
                                        
                                    }
                                    .padding(.vertical, 5)
                                    //                    .frame(maxWidth: .infinity, alignment: .leading)
//                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                                }
                                
                            }
                        }
                        HStack{
                            Text("Status: ")
                            HStack{
                                Button(action: {
                                    buttonClicked = 1
                                    status = "Error"
                                }, label: {
                                    Text("Error")
                                        .padding(4)
                                        .foregroundStyle(Color.white)
                                        .background(buttonClicked == 1 ? Color.red : Color.black)
                                        .cornerRadius(8)
                                })
                                Button(action: {
                                    buttonClicked = 2
                                    status = "Good to go"
                                  
                                }, label: {
                                    Text("Good to go")
                                        .padding(4)
                                        .foregroundStyle(Color.white)
                                        .background(buttonClicked == 2 ? Color.green : Color.black)
                                        .cornerRadius(8)
                                })
                            }
                        }
                       
                    }
                    .padding(.top, 20)
                
                    Spacer()
                    Spacer()
//                    Spacer()
//                    Spacer()
                    VStack(alignment: .leading){
                        HStack{
                            Text("Building: ")
                            Text(storedUser.user?.branchName ?? "")
                                .fontWeight(.bold)
                        }
                        .padding(.bottom, 10)
                        HStack{
                            Text("Date: ")
                            Text(pickerDate)
                                .fontWeight(.bold)
                        }
                        .padding(.bottom, 10)
                     
                        HStack{
                            Text("Time: ")
                            Text(pickerTime)
                                .fontWeight(.bold)
                        }
                        .padding(.bottom, 10)
                        HStack{
                            Text("ODO: ")
                            TextField("Odometer",text: $odometer)
//                                .padding(.horizontal,20)
                                .fontWeight(.bold)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.ultraThinMaterial)
                                       
                                )
                                
                                
                        }
                    }
                    .padding(.top, 20)
            
                    .padding(.horizontal,30)
                }
                .padding()
                
                .border(Color(dividerColor))
                
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.leading)
            Rectangle()
                .fill(Color(dividerColor))
                .frame(height: 2)
                .edgesIgnoringSafeArea(.horizontal)
            //                    Spacer()
            
            
            Spacer()
                .frame(height: 25)
        }
    }
}

//#Preview {
//   
//    PickerHeader( pickerInfo: AssetModel.temporary)
//}
