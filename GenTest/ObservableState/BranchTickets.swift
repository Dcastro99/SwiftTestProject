//
//  BranchTickets.swift
//  GenTest
//
//  Created by Danny Castro on 3/11/24.
//



import SwiftUI
import Combine

class BranchTickets: ObservableObject {
    @Published var tickets: [GetTicketModel] = [] 
//    {
//        didSet {
//            // This will be called whenever the tickets array is updated
////            print("Tickets updated: \(tickets)")
//        }
//    }
    
    // Your existing init(data:) method
    init(data: Data?) {
        if let data = data {
            do {
                let ticketModels = try JSONDecoder().decode([GetTicketModel].self, from: data)
                setTickets(data: ticketModels)
            } catch {
                print("Error decoding tickets: \(error.localizedDescription)")
            }
        }
    }
    
    func setTickets(data: [GetTicketModel]) {
        self.tickets = data
    }
}

