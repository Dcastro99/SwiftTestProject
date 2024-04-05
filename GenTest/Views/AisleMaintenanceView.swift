//
//  AisleMaintenanceView.swift
//  GenTest
//
//  Created by Danny Castro on 3/25/24.
//

import SwiftUI

struct AisleMaintenanceView: View {
    @State private var selectedItems: [String] = []
    @State var aisle = ""
    var body: some View {
        ZStack{
            VStack{
                Text("Aisle Maintenance Form")
                    .font(.title)
                AisleMaintenaceHeader(aisle: $aisle)
                    .padding(.bottom, 20)
               
//                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), alignment: .leading), GridItem(.flexible(), alignment: .top)]) {
                        ForEach(AMQCategories.allCases, id: \.self) { category in
                            VStack(alignment: .leading) {
                                Text("\(category.description)")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding(.bottom,8)
                                VStack(alignment: .leading){
                                    let items = self.items(for: category)
                                    ForEach(items, id: \.self) { item in
                                        HStack(alignment: .center){
                                            Toggle("", isOn: Binding(
                                                get: { self.selectedItems.contains(item) },
                                                set: { isChecked in
                                                    if isChecked {
                                                        self.selectedItems.append(item)
                                                    } else {
                                                        self.selectedItems.removeAll(where: { $0 == item })
                                                    }
                                                }
                                            ))
                                            .toggleStyle(Checkbox())
                                            .font(.system(size: 25))
                                            Text(item)
                                        }
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            .border(.gray)
                        }
                    }
                    
                Spacer()
                Button(action: {
                    print("Ailse: \(aisle)")
                }, label: {
                    Text("Submit")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .background(.black)
                        .cornerRadius(8)
                })
            }// Main Vstack
            .padding()
            
        }
//        .navigationTitle("Aisle Maintenance Form")
//        .navigationBarTitleDisplayMode(.inline)
//        .navig
    }
    func items(for category: AMQCategories) -> [String] {
        switch category {
        case .basic: return basicList
        case .safety: return safetyList
        case .product: return productList
        case .bin: return binList
        case .label: return labelList
        }
    }
}

#Preview {
    AisleMaintenanceView()
}
