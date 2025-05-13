//
//  CurrencyListModel.swift
//  JoCambio
//
//  Created by Jobson on 13/05/25.
//

class CurrencyListResponse{
    
    let name: String
    let code: String
    
    init(name: String, code: String) {
        self.name = name
        self.code = code
    }
}
