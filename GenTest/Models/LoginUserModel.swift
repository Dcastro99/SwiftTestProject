//
//  LoginUserModel.swift
//  GenTest
//
//  Created by Danny Castro on 3/5/24.
//

import SwiftUI

struct LoginUserModel: Codable {
    struct User: Codable {
        let user_id: Int
        let name: String
        let empNum: Int
        let new_emp: Bool
        let email: String
        let image: String
        let role: Int
        let branch_ids: [Int]
    }
    
    let user: User
    let token: String
  
}
