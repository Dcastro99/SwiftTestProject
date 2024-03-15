//
//  StoreUser.swift
//  GenTest
//
//  Created by Danny Castro on 3/5/24.
//

import SwiftUI

struct StoreUser {
    let user_id: Int
    let name: String
    let empNum: Int
    let new_emp: Bool
    let email: String
    let image: String
    let role: Int
    let branch_ids: [Any]
    var branchId: Int
    
    
    
    init(data: [String: Any]) {
        self.user_id = data["user_id"] as? Int ?? 0
        self.name = data["name"] as? String ?? ""
        self.empNum = data["empNum"] as? Int ?? 0
        self.new_emp = data["new_emp"] as? Bool ?? false
        self.email = data["email"] as? String ?? ""
        self.image = data["image"] as? String ?? ""
        self.role = data["role"] as? Int ?? 0
        self.branch_ids = data["branch_ids"] as? [Any] ?? []
        self.branchId = data["branchId"] as? Int ?? 0
    }
}
