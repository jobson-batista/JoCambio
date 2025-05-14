//
//  CurrencyListModel.swift
//  JoCambio
//
//  Created by Jobson on 13/05/25.
//

class CurrencyListResponse: Codable {
    
    let success: Bool
    let currencies: [String: String]
    
    init(success: Bool, currencies: [String : String]) {
        self.success = success
        self.currencies = currencies
    }
}
