//
//  GetBranchWillCallAPI.swift
//  GenTest
//
//  Created by Danny Castro on 3/11/24.
//

import SwiftUI

func GetBranchTickets(token: String?, id branch_id: Int, storedTickets: BranchTickets) async throws -> [GetTicketModel] {
    guard let unwrappedJwtToken = token else {
        throw GetUserError.invalidToken
    }
    
    guard let baseUrlString = ProcessInfo.processInfo.environment["API_KEY"],
          let baseUrl = URL(string: baseUrlString) else {
        throw GetUserError.invalidURL
    }
    
    let getUrl = baseUrl.appendingPathComponent("sqlGetBranchTickets/\(branch_id)")
    var request = URLRequest(url: getUrl)
    request.httpMethod = "GET"
    request.addValue("Bearer \(unwrappedJwtToken)", forHTTPHeaderField: "Authorization")
    
    let (data, response) = try await URLSession.shared.data(for: request)
  
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw GetUserError.invalidResponse
    }
    do {
        print("GET-Tickets")
        let decoder = JSONDecoder()
   
        let ticketModel = try decoder.decode([GetTicketModel].self, from: data)
//       print(ticketModel)
            DispatchQueue.main.async {
//                print("ticketModel ")
                storedTickets.setTickets(data: ticketModel)
            }
//
     
       
        
        return ticketModel
    } catch {
        print("ERROR: ", error)
        throw GetUserError.invalidData
    }
    
    
    
}


enum GetTicketError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidToken
}
//storedTickets.setTickets(data:
                            //                                        [
                         //                                            [
                         //                    "id": ticketModel.id,
                         //                    "user_id": ticketModel.user_id,
                         //                    "empNum": ticketModel.empNum,
                         //                    "image": ticketModel.image,
                         //                    "name": ticketModel.name,
                         //                    "pickTicket": ticketModel.pickTicket,
                         //                    "branch_id": ticketModel.branch_id,
                         //                    "customerPO": ticketModel.customerPO,
                         //                    "ticketTimeStamp": ticketModel.ticketTimeStamp,
                         //                    "addedTMTimeStamp": ticketModel.addedTMTimeStamp,
                         //                    "customerName": ticketModel.customerName,
                         //                    "orderNumber": ticketModel.orderNumber
                         //                ]
                         //                                        ]
                         //            )
