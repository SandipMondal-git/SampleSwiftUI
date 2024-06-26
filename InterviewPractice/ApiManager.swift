//
//  ApiManager.swift
//  InterviewQuestion
//
//  Created by Sandip Mondal on 25/06/24.
//

import Foundation


enum networkError: Error {
    case invalidUrl
    case invalidResponse
}

final class ApiManager {
    
    func request<T: Decodable>(urlString: String) async throws  -> T {
        guard let url = URL(string: urlString) else {
            throw networkError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw networkError.invalidResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
