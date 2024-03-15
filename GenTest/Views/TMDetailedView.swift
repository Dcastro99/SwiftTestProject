//
//  TMDetailedView.swift
//  GenTest
//
//  Created by Danny Castro on 3/7/24.
//

import SwiftUI

struct TMDetailedView: View {
    @EnvironmentObject var storedTickets: BranchTickets
   
    
    var body: some View {
        VStack {
            Text("Detail View")
            List(storedTickets.tickets, id: \.id) { ticket in
                // Display ticket information here
                Text("Ticket ID: \(ticket.id)")
                Text("Customer Name: \(ticket.customerName)")
                // Add more Text views for other ticket properties
            }
           
        }
       
    }
}

#Preview {
    TMDetailedView()
}
