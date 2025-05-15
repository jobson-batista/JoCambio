//
//  CurrencyLiveService.swift
//  JoCambio
//
//  Created by Jobson on 14/05/25.
//

import Foundation

class CurrencyLiveService {
    
    private let URL_API_LIVE = "https://raw.githubusercontent.com/Banking-iOS/mock-interview/main/api/live.json"
    
    static let shared =  CurrencyLiveService()
    
    private init() {}
    
    func fetchData() async throws -> [String: Double] {
        guard let url = URL(string: URL_API_LIVE) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(CurrencyLiveResponse.self, from: data)
        return result.quotes
    }
}
