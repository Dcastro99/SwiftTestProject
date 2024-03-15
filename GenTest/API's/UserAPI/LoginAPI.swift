//
//  LoginAPI.swift
//  GenTest
//
//  Created by Danny Castro on 3/5/24.
//

import SwiftUI

func LoginAPI(email: String, password: String) async throws -> LoginUserModel {
    guard let baseUrlString = ProcessInfo.processInfo.environment["API_KEY"],
          let baseUrl = URL(string: baseUrlString) else {
        throw Login3Error.invalidURL
    }
    
    let body: [String: Any] = [
        "email": email,
        "password": password
    ]
    
    guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
        throw Login3Error.invalidJSON
    }
    
    var request = URLRequest(url: baseUrl.appendingPathComponent("sqllogin"))
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue(baseUrlString, forHTTPHeaderField: "API_KEY")
    request.httpBody = jsonData
    
    var responseMessage: LoginUserModel?
 
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw Login3Error.invalidResponse
            }
//            print("Status code: \(httpResponse.statusCode)")
//            print("data \(String(data: data, encoding: .utf8) ?? "Failed to decode data")")
            if httpResponse.statusCode == 200 {
//                print("login 200")
                let decoder = JSONDecoder()
                responseMessage = try decoder.decode(LoginUserModel.self, from: data)
            } else if httpResponse.statusCode == 400 {
//                print("login 400")
                let decoder = JSONDecoder()
                let errorResponse = try decoder.decode([String: String].self, from: data)
//                print("errorRes: \(errorResponse)")
                let errorMessage = errorResponse["password"] ?? errorResponse["email"] ?? "Unknown error"
                throw Login3Error.customError(message: errorMessage)
            }
            else {
                throw Login3Error.invalidData
            }
        } catch let error {
            throw error
        }
    guard let responseMessage = responseMessage else {
        throw Login3Error.invalidData 
    }

    
    return responseMessage
}





enum Login3Error: Error {
    case customError(message: String)
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidToken
    case invalidJSON
    
}
