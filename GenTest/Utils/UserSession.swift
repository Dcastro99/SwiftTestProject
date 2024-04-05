//
//  UserSession.swift
//  GenTest
//
//  Created by Danny Castro on 3/21/24.
//

import SwiftUI

struct UserSession {
    
    
    static func signOut() {
        @AppStorage("token") var userToken: String?
        @AppStorage("Signed_in") var currentUserSignedIn: Bool = false
        @AppStorage("first_login") var firstLogin: Bool = false
        
        userToken = nil
        currentUserSignedIn = false
        firstLogin = false
    }
}
