//
//  BCHeader.swift
//  GenTest
//
//  Created by Danny Castro on 3/27/24.
//

import SwiftUI

struct BCHeader: View {
    let dividerColor = #colorLiteral(red: 0.7843137255, green: 0.3921568627, blue: 0.2039215686, alpha: 1)
    var body: some View {
        HStack{
            let url = URL(string:"https://i.imgur.com/36OFTeQ.png")
            
            
            AsyncImage(url: url) { phase in
                switch phase {
                case.empty:
                    ProgressView()
                case.success(let returnImage):
                    
                    returnImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
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
            Spacer()
            Text("Branch Inspection Checklist")
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.accentColor)
                .padding(.trailing, 50)
            
        }
        
       Divider2()
            .padding(.bottom)
        HStack{
            VStack(alignment: .trailing){
                Text("Performed By: ")
                Text("Branch: ")
                Text("Date: ")
            }
            
            VStack(alignment: .leading){
                Text("Yoshi")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Seattle")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("8/24/2024")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    BCHeader()
}
