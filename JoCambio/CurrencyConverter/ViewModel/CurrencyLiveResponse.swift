//
//  CurrencyLive.swift
//  JoCambio
//
//  Created by Jobson on 14/05/25.
//

class CurrencyLiveResponse: Codable {
    
    var success: Bool
    var source: String
    var quotes: [String: Double]
    
    init(success: Bool, source: String, quotes: [String : Double]) {
        self.success = success
        self.source = source
        self.quotes = quotes
    }
    
}
