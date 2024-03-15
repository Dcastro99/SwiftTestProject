//
//  TicketModel.swift
//  GenTest
//
//  Created by Danny Castro on 3/11/24.
//

import SwiftUI

struct GetTicketModel: Codable {
    
    let id: Int
    let user_id: Int
    let empNum: Int
    let image: String
    let name: String
    let pickTicket: String?
    let branch_id: Int
    let customerPO: String
    let ticketTimeStamp: String?
    let addedTMTimeStamp: String?
    let customerName: String
    let orderNumber: String
    
}
