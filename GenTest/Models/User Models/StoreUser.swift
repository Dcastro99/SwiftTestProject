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
    var branchName: String {
        guard let branch = branches.first(where: { $0.id == branchId }) else {
            return "Unknown Branch"
        }
        return branch.branch
    }
    
    
    
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
    
    enum RoleType {
        case teamMember
        case manager
        // Add more roles as needed
    }
    var roleDescription: String {
        switch role {
        case 5:
            return "Team Member"
        case 3:
            return "Manager"
            // Add more cases as needed
        default:
            return "Unknown"
        }
    }
    
    var roleType: RoleType {
        switch role {
        case 5:
            return .teamMember
        case 3:
            return .manager
            // Add more cases as needed
        default:
            return .teamMember // Default to Team Member
        }
    }
    
    
}
