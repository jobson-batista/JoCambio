//
//  String.swift
//  JoCambio
//
//  Created by Jobson on 17/05/25.
//

import Foundation

extension String {
    
    func currencyToString(symbol: String) -> Double? {
        let cleanedString = self.replacingOccurrences(of: symbol, with: "").trimmingCharacters(in: .whitespaces)
        let noThousandSeparator = cleanedString.replacingOccurrences(of: ".", with: "")
        let normalizedString = cleanedString.replacingOccurrences(of: ",", with: ".")
        return Double(normalizedString)
    }
}
