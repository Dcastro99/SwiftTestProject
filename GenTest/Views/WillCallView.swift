//
//  WillCallView.swift
//  GenTest
//
//  Created by Danny Castro on 3/11/24.
//

import SwiftUI

struct WillCallView: View {
    @AppStorage("token") var userToken: String?
    @EnvironmentObject var storedTickets: BranchTickets
    @EnvironmentObject var storedUser: UserObs
    @State private var tickets: [GetTicketModel]?
    
   private var url = URL(string:"https://mario.nintendo.com/static/d783068682f98d6cfec666c747a27793/d6e64/mario.png")
    private var newUrl = URL(string: "https://res.cloudinary.com/drxpgaiaw/image/upload/v1701714370/willCall/izvs1g6klwhqtgtymord.jpg")
    private var  bgColor = #colorLiteral(red: 0.6237647913, green: 0.6237647913, blue: 0.6237647913, alpha: 0.2984788907)
  private var mainBgColor = #colorLiteral(red: 0.8131273912, green: 0.7377171282, blue: 0.578667129, alpha: 0.3209592301)
    let mainBG = #colorLiteral(red: 0.9914150834, green: 0.9771276116, blue: 0.9294666648, alpha: 1)
    let cardColor = #colorLiteral(red: 0.9265309343, green: 0.9265309343, blue: 0.9265309343, alpha: 1)
 
    
    var body: some View {
        
    ZStack  {
        Color(mainBG).ignoresSafeArea(.all)
      
          ScrollView {
              VStack(spacing: 10) {
               
                  if  storedTickets.tickets.count > 0  {
                      ForEach(storedTickets.tickets, id: \.id){ ticket in
                          
                          ZStack{
                              RoundedRectangle(cornerRadius: 20)
                                  .foregroundStyle(Color.white)
                                  .shadow(radius: 1, x: -2, y: 5)
                              VStack{
                                  Spacer()
                                  VStack{
                                      Circle()
                                          .frame(width: 100,height: 100)
                                          .overlay(
                                            AsyncImage(url: URL(string: ticket.image)) { phase in
                                                switch phase {
                                                case.empty:
                                                    ProgressView()
                                                case.success(let returnImage):
                                                    returnImage
                                                        .resizable()
                                                        .scaledToFill()
    //                                                    .frame(width: 150, height: 150)
                                                        .clipShape(Circle())
    //                                                    .background(.ultraThinMaterial)

                                                case.failure:
                                                    VStack(spacing:20){
                                                        Image(systemName: "exclamationmark.triangle.fill")
                                                            .font(.system(size: 100))
                                                        
                                                        Text("No image found!")
                                                            .font(.headline)
                                                    }
                                                    
                                                default:
                                                    Image(systemName: "questionmark")
                                                        .font(.title)
                                                }
                                            }
                                          )
                                     
                                      Text(ticket.name)
                                          .font(.title)
                                          .padding(2)
                                  }
                                  Divider()
                                      .padding(.horizontal,25)
                                  VStack{
                                      
                                      Text("Customer Name")
                                          .font(.caption)
                                      

                                          Text(ticket.customerName)
                                          .font(.title)
                                          .foregroundStyle(Color.accentColor)

                                              .padding(.vertical,8)

                                          Text("Customer PO")
                                          .font(.caption)

                                          Text(ticket.customerPO)
                                          .font(.title)
                                          .foregroundStyle(Color.accentColor)

                                            .padding(.vertical,8)

                                      Text("Order Number")
                                          .font(.caption)
                                      
                                      Text(ticket.orderNumber)
                                          .font(.title)
                                          .foregroundStyle(Color.accentColor)
                                      
                                          .padding(.vertical,8)
                                      Divider()
                                          .padding(.horizontal,25)
                                  }
                                  .padding(40)
                                  Spacer()
                              }
                              
                          }
//                          .shadow(radius: 1, x: -2, y: 5)
                          .padding(.horizontal,50)

                      }
                      .scrollContentBackground(.hidden)
                      .listStyle(PlainListStyle())
                  }else {
                      Text("no lives")
                  }
      
                }
            }
//          .padding(.top,1)
          .toolbarBackground(Color(mainBgColor), for: .navigationBar)
          
          .toolbarBackground(.hidden, for: .navigationBar)
          
        
      }
    .onAppear{
        print("in WillCallView Page")
        if (userToken != nil) {
            Task {
                do {
                    
                    tickets = try await  GetBranchTickets(token: userToken, id: storedUser.user?.branchId ?? 99, storedTickets: storedTickets)
                }
            }
        }
    }
     
    }
    
}

#Preview {
    WillCallView()
}
