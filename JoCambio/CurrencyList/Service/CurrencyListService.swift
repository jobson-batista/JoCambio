//
//  CurrencyListService.swift
//  JoCambio
//
//  Created by Jobson on 13/05/25.
//

import Foundation

class CurrencyListService {
    
    private let URL_API = "https://raw.githubusercontent.com/Banking-iOS/mock-interview/main/api/list.json"
    static let shared = CurrencyListService() // Única instancia. Semelhante ao Singleton
    
    public var currencies: [String:String]?
    
    private init() {} // Não permite ser instanciado novamente.
    
    func fetchCurrencies() async throws -> [String: String]{
        guard let url = URL(string: URL_API) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(CurrencyListResponse.self, from: data)
        return result.currencies
    }
}
