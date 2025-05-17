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
    
    private func fetchData() async throws -> [String: Double] {
        guard let url = URL(string: URL_API_LIVE) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(CurrencyLiveResponse.self, from: data)
        Log.info("Requisição feita em \(url)")
        return result.quotes
    }
    
    func convert(value: Double, from: String, to: String) async throws -> Double {
        
        var result = 0.0
        let currencies: [String: Double] = try await self.fetchData()
        
        // MARK: Aumentei a dose de café pra resolver essa lógica :D
        /* Regra de 3 Simples, para encontrar valor em dolar.
            1 USD -> 0.000018313373 BTC
            X USD -> 1 BTC * Value (Ex: 1 * 2 btc)
            Value = 0.000018313373 X
            X = Value / 0.000018313373
         */
        
        // 1. Converter valor para dolar
        let dollar: Double = value / (currencies["USD\(from.uppercased())"] ?? 0.0)
        
        // 2. Converter valor para moeda destino
        result = dollar * (currencies["USD\(to.uppercased())"] ?? 0.0)
        
        Log.info("Valor convertido: \(result) \(to.uppercased())")
        return result
    }
    
    func getSymbolCurrency(code: String) -> String {
        
        let currencySymbols: [String: String] = [
            "AED": "د.إ",
            "AFN": "؋",
            "ALL": "L",
            "AMD": "֏",
            "ANG": "ƒ",
            "AOA": "Kz",
            "ARS": "$",
            "AUD": "A$",
            "AWG": "ƒ",
            "AZN": "₼",
            "BAM": "KM",
            "BBD": "$",
            "BDT": "৳",
            "BGN": "лв",
            "BHD": ".د.ب",
            "BIF": "FBu",
            "BMD": "$",
            "BND": "$",
            "BOB": "Bs.",
            "BRL": "R$",
            "BSD": "$",
            "BTC": "₿",
            "BTN": "Nu.",
            "BWP": "P",
            "BYN": "Br",
            "BYR": "Br",
            "BZD": "BZ$",
            "CAD": "C$",
            "CDF": "FC",
            "CHF": "CHF",
            "CLF": "UF",
            "CLP": "$",
            "CNY": "¥",
            "COP": "$",
            "CRC": "₡",
            "CUC": "$",
            "CUP": "$",
            "CVE": "$",
            "CZK": "Kč",
            "DJF": "Fdj",
            "DKK": "kr",
            "DOP": "RD$",
            "DZD": "دج",
            "EGP": "£",
            "ERN": "Nfk",
            "ETB": "Br",
            "EUR": "€",
            "FJD": "$",
            "FKP": "£",
            "GBP": "£",
            "GEL": "₾",
            "GGP": "£",
            "GHS": "₵",
            "GIP": "£",
            "GMD": "D",
            "GNF": "FG",
            "GTQ": "Q",
            "GYD": "$",
            "HKD": "HK$",
            "HNL": "L",
            "HRK": "kn",
            "HTG": "G",
            "HUF": "Ft",
            "IDR": "Rp",
            "ILS": "₪",
            "IMP": "£",
            "INR": "₹",
            "IQD": "ع.د",
            "IRR": "﷼",
            "ISK": "kr",
            "JEP": "£",
            "JMD": "J$",
            "JOD": "د.ا",
            "JPY": "¥",
            "KES": "KSh",
            "KGS": "лв",
            "KHR": "៛",
            "KMF": "CF",
            "KPW": "₩",
            "KRW": "₩",
            "KWD": "د.ك",
            "KYD": "$",
            "KZT": "₸",
            "LAK": "₭",
            "LBP": "ل.ل",
            "LKR": "Rs",
            "LRD": "$",
            "LSL": "L",
            "LTL": "Lt",
            "LVL": "Ls",
            "LYD": "ل.د",
            "MAD": "د.م.",
            "MDL": "L",
            "MGA": "Ar",
            "MKD": "ден",
            "MMK": "K",
            "MNT": "₮",
            "MOP": "MOP$",
            "MRO": "UM",
            "MUR": "₨",
            "MVR": "Rf",
            "MWK": "MK",
            "MXN": "$",
            "MYR": "RM",
            "MZN": "MT",
            "NAD": "$",
            "NGN": "₦",
            "NIO": "C$",
            "NOK": "kr",
            "NPR": "₨",
            "NZD": "NZ$",
            "OMR": "ر.ع.",
            "PAB": "B/.",
            "PEN": "S/",
            "PGK": "K",
            "PHP": "₱",
            "PKR": "₨",
            "PLN": "zł",
            "PYG": "Gs",
            "QAR": "﷼",
            "RON": "lei",
            "RSD": "дин",
            "RUB": "₽",
            "RWF": "FRw",
            "SAR": "﷼",
            "SBD": "$",
            "SCR": "₨",
            "SDG": "ج.س.",
            "SEK": "kr",
            "SGD": "S$",
            "SHP": "£",
            "SLL": "Le",
            "SOS": "S",
            "SRD": "$",
            "STD": "Db",
            "SVC": "$",
            "SYP": "£",
            "SZL": "L",
            "THB": "฿",
            "TJS": "ЅМ",
            "TMT": "T",
            "TND": "د.ت",
            "TOP": "T$",
            "TRY": "₺",
            "TTD": "TT$",
            "TWD": "NT$",
            "TZS": "TSh",
            "UAH": "₴",
            "UGX": "USh",
            "UYU": "$U",
            "UZS": "лв",
            "VEF": "Bs.F",
            "VND": "₫",
            "VUV": "VT",
            "WST": "T",
            "XAF": "FCFA",
            "XAG": "oz",
            "XAU": "oz",
            "XCD": "$",
            "XDR": "SDR",
            "XOF": "CFA",
            "XPF": "₣",
            "YER": "﷼",
            "ZAR": "R",
            "ZMK": "ZK",
            "ZMW": "ZK",
            "ZWL": "Z$"
        ]
        return currencySymbols[code] ?? "$"
    }
}
