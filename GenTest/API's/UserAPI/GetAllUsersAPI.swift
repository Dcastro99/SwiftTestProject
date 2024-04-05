//
//  GetAllUsersAPI.swift
//  GenTest
//
//  Created by Danny Castro on 3/15/24.
//

import SwiftUI

func GetAllUsers(token: String?, id branch_id: Int) async throws -> [GetAllUsersModel] {
    guard let unwrappedJwtToken = token else {
        throw GetUserError.invalidToken
    }
    
    guard let baseUrlString = ProcessInfo.processInfo.environment["API_KEY"],
          let baseUrl = URL(string: baseUrlString) else {
        throw GetUserError.invalidURL
    }
    
    let getUrl = baseUrl.appendingPathComponent("sqlusers/\(branch_id)")
    var request = URLRequest(url: getUrl)
    request.httpMethod = "GET"
    request.addValue("Bearer \(unwrappedJwtToken)", forHTTPHeaderField: "Authorization")
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw GetUserError.invalidResponse
    }
    do {
        print("GET-ALL-USER")
        let decoder = JSONDecoder()
        let userModel = try decoder.decode([GetAllUsersModel].self, from: data)

        
        return userModel
    } catch {
        throw GetUserError.invalidData
    }
    
    
    
}


enum GetAllUserError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidToken
}

