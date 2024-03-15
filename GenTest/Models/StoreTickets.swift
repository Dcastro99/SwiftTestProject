////
////  StoreTickets.swift
////  GenTest
////
////  Created by Danny Castro on 3/11/24.
////
//
//import SwiftUI
//
//struct StoreTickets {
//    let tickets: [Ticket]
//    
//    init(data: [[String: Any]]) {
//        self.tickets = data.map { Ticket(data: $0) }
//    }
//}
//
//struct Ticket {
//    let id: Int
//    let user_id: Int
//    let empNum: Int
//    let image: String
//    let name: String
//    let pickTicket: Int
//    let branch_id: Int
//    let customerPO: String
//    let ticketTimeStamp: Date
//    let addedTMTimeStamp: Date
//    let customerName: String
//    let orderNumber: String
//    
//    init(data: [String: Any]) {
//        self.id = data["id"] as? Int ?? 0
//        self.user_id = data["user_id"] as? Int ?? 0
//        self.name = data["name"] as? String ?? ""
//        self.empNum = data["empNum"] as? Int ?? 0
//        self.image = data["image"] as? String ?? ""
//        self.pickTicket = data["pickTicket"] as? Int ?? 0
//        self.branch_id = data["branch_id"] as? Int ?? 0
//        self.customerPO = data["customerPO"] as? String ?? ""
//        self.ticketTimeStamp = data["ticketTimeStamp"] as? Date ?? Date()
//        self.addedTMTimeStamp = data["addedTMTimeStamp"] as? Date ?? Date()
//        self.customerName = data["customerName"] as? String ?? ""
//        self.orderNumber = data["orderNumber"] as? String ?? ""
//    }
//}
//
