//
//  LocationManager.swift
//  LocationSampleApp
//
//  Created by Javier Calatrava on 30/11/24.
//

import SwiftUI
import Foundation

@globalActor
actor GlobalManager {
    static var shared = GlobalManager()
}

@GlobalManager
protocol GraphQLManagerProtocol {
    func fetchData(userId: String) async -> (Result<User, Error>)
}

@GlobalManager
class GraphQLManager: ObservableObject {

    @MainActor
    static let shared = GraphQLManager()

}

extension GraphQLManager: GraphQLManagerProtocol {

    func fetchData(userId: String) async -> (Result<User, Error>) {
        
        let url = URL(string: "http://localhost:4000/")!
        let query = """
        query  {
          getUser(id: "\(userId)") {
            id
            name
          }
        }
        """
        
        let body: [String: Any] = [
            "query": query
        ]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
            return .failure(NSError(domain: "Invalid JSON", code: 400, userInfo: nil))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                return .failure(ErrorService.invalidHTTPResponse)
            }
            do {
                let graphQLResponse = try JSONDecoder().decode(GraphQLResponse<GraphQLQuery>.self, from: data)
                return .success(graphQLResponse.data.user)
            } catch {
                return .failure(ErrorService.failedOnParsingJSON)
            }
        } catch {
            return .failure(ErrorService.errorResponse(error))
        }
    }
  
}
