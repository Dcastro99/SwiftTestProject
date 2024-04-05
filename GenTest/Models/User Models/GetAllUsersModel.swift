//
//  GetAllUsersModel.swift
//  GenTest
//
//  Created by Danny Castro on 3/15/24.
//

import SwiftUI

struct GetAllUsersModel: Codable  {

    let user_id: Int
    let name: String
    let empNum: Int
    let email: String
    let image: String
    let role: Int
    let branch_ids: [Int]
    
    
}
