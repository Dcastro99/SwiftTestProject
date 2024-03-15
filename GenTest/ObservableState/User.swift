//
//  User.swift
//  GenTest
//
//  Created by Danny Castro on 3/5/24.
//

import SwiftUI
import Combine

class UserObs: ObservableObject {
    @Published var user: StoreUser?
    
    init(data: [String: Any]?) {
        if let data = data {
            setUser(data: data)
        }
    }
    
    
    
    func setUser(data: [String: Any]) {
        
        self.user = StoreUser(data: data)
//        if let user = self.user {
//            
//            print("user in UserObs Class---> \(user)")
//            
//        } else {
//            print("user is nil")
//        }
    }
    
    
    func updateBranchId(branchId: Int) {
        if var user = user {
            user.branchId = branchId
            self.user = user
        }
    }
    
    
}
