//
//  PickerDisplay.swift
//  GenTest
//
//  Created by Danny Castro on 3/21/24.
//

import SwiftUI

let assetTest = (assetNum: "4035", image: "https://i.imgur.com/lcfAr5y.jpg", type: "Picker", model: "5500")

struct PickerDisplay: View {
    @State private var isChecked = false
    @State private var selectedNames: Set<String> = []
    @State private var odometer: String = ""
    @State private var status: String = ""
    @State var notes = ""
    @State private var showAlert = false
    @State var alertType: MyAlerts? = nil
    let pickerInfo: AssetModel
    let dividerColor = #colorLiteral(red: 0.7836529594, green: 0.7627409962, blue: 0.7736164322, alpha: 0.5)
    let mainBG = #colorLiteral(red: 0.9914150834, green: 0.9771276116, blue: 0.9294666648, alpha: 1)
    
    enum MyAlerts {
        case odometer
        case status
    }
    
    var body: some View {
        let placeholder = "Enter notes here..."
        ZStack {
            Color.white.ignoresSafeArea(.all)
            GeometryReader { proxy in
                ScrollView {
                    VStack {
                        Text("\(pickerInfo.type) Check List")
                            .font(.title)
                            .fontWeight(.bold)
                            .underline()
                        PickerHeader(status: $status, selectedNames: $selectedNames, odometer: $odometer,pickerInfo: pickerInfo )
                        HStack {
                            VStack(alignment: .leading) {
                                ForEach(checkList.prefix(checkList.count / 2), id: \.self) { name in
                                    HStack {
                                        Toggle("", isOn: Binding(
                                            get: { selectedNames.contains(name) },
                                            set: { isChecked in
                                                if isChecked {
                                                    selectedNames.insert(name)
                                                } else {
                                                    selectedNames.remove(name)
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
                            Spacer()
                                .frame(width: 50)
                            VStack(alignment: .leading) {
                                ForEach(checkList.suffix(checkList.count / 2), id: \.self) { name in
                                    HStack {
                                        Toggle("", isOn: Binding(
                                            get: { selectedNames.contains(name) },
                                            set: { isChecked in
                                                if isChecked {
                                                    selectedNames.insert(name)
                                                } else {
                                                    selectedNames.remove(name)
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
                        }
                        ZStack(alignment: .topLeading) {
                            if notes.isEmpty {
                                Text(placeholder)
                                    .foregroundColor(.gray)
                            }
                            TextEditor(text: $notes)
                                .background(.ultraThinMaterial)
                                .cornerRadius(10)
                                .padding()
                                .padding(.top, 8)
                        }
                        .scrollContentBackground(.hidden)
                        .padding(.horizontal, 40)
                        
                        Button(action: {
                            if odometer.isEmpty{
                                alertType = .odometer
                                showAlert = true
                            }
                            if status == "Error" && selectedNames.filter({$0 != "Electric" && $0 != "Gas"}).isEmpty{
                                alertType = .status
                                showAlert = true
                            }
                            print("Notes: \(notes)")
                            print("Selected Boxes \(selectedNames)")
                            print("Odometer: \(odometer)")
                            print("Status: \(status)")
                            //
                            $notes.wrappedValue = ""
                        }, label: {
                            Text("Submit")
                                .font(.title)
                                .frame(maxWidth: 150, maxHeight: 50)
                                .foregroundColor(Color.white)
                                .background(.black)
                                .cornerRadius(10)
                        })
                        .padding()
                        .alert(isPresented: $showAlert) {
                            getAlert()
                        }
                        
                    }//MAIN VSTACK
                    .background(Color.white)
                    .listRowInsets(EdgeInsets())
                    .frame(minHeight: proxy.size.height)
                   
                    //                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                } // SCrollView
                .tint(Color.black)
                
            }
            //
        }
    
    }
    func getAlert() -> Alert{
        switch alertType {
        case .odometer:
            return  Alert(
                title: Text("Odometer is Empty"),
                message: Text("Please enter the odometer reading."),
                dismissButton: .default(Text("OK"))
            )
        case .status:
            return  Alert(
                title: Text("Status Error"),
                message: Text("Please give reason for Error."),
                dismissButton: .default(Text("OK"))
            )
        default:
            return Alert(title: Text("Error"))
        }

    }
}

#Preview {
    PickerDisplay(pickerInfo: AssetModel.temporary)
}
