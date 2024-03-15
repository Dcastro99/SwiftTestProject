//
//  GetUserAPI.swift
//  GenTest
//
//  Created by Danny Castro on 3/5/24.
//

import SwiftUI

func GetUser(token: String?, storeUser: UserObs) async throws -> GetUserModel {
    guard let unwrappedJwtToken = token else {
        throw GetUserError.invalidToken
    }
    
    guard let baseUrlString = ProcessInfo.processInfo.environment["API_KEY"],
          let baseUrl = URL(string: baseUrlString) else {
        throw GetUserError.invalidURL
    }
    
    let getUrl = baseUrl.appendingPathComponent("sqluser")
    var request = URLRequest(url: getUrl)
    request.httpMethod = "GET"
    request.addValue("Bearer \(unwrappedJwtToken)", forHTTPHeaderField: "Authorization")
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw GetUserError.invalidResponse
    }
    do {
        print("GET-USER")
        let decoder = JSONDecoder()
        //            decoder.keyDecodingStrategy = .convertFromSnakeCase
        //            print(data)
        //            return try decoder.decode(UserData2.self, from: data)
        let userModel = try decoder.decode(GetUserModel.self, from: data)
        DispatchQueue.main.async {
            storeUser.setUser(data: ["user_id": userModel.user_id,
                                     "name": userModel.name,
                                     "empNum": userModel.empNum,
                                     "new_emp": userModel.new_emp,
                                     "email": userModel.email,
                                     "image": userModel.image,
                                     "role": userModel.role,
                                     "branch_ids": userModel.branch_ids,
                                     "branchId": userModel.branch_ids[0]
                                    ])
           
            
            
        }
        
        
        return userModel
    } catch {
        throw GetUserError.invalidData
    }
    
    
    
}


enum GetUserError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidToken
}
