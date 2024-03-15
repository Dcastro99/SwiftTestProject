//
//  SideMenu.swift
//  GenTest
//
//  Created by Danny Castro on 3/6/24.
//

import SwiftUI

struct SideMenu: View {
    @State var presentSideMenu = false
    
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    HStack {
                        Button {
                            presentSideMenu.toggle()
                        } label: {
                            Image("Menu")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                
                        }
                        .frame(width: 24, height: 24)
                        .padding(.leading, 30)
                        
                        Spacer()
                    }
                }
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color.white)
                    .zIndex(1)
                    .shadow(radius: 0.3)
                , alignment: .top)
            .background(Color.gray.opacity(0.8))
            
            SideMenu()
        }
        
        .frame(maxWidth: .infinity)
        
    }
    
    
    @ViewBuilder
    private func SideMenu() -> some View {
    testPage(isShowing: $presentSideMenu, Direction: .leading) {
            SideMenuViewContents(presentSideMenu: $presentSideMenu)
                .frame(width: 300)
        }
    }
    
}

#Preview {
    SideMenu()
}
