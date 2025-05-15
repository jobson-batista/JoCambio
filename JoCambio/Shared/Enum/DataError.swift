//
//  DataError.swift
//  JoCambio
//
//  Created by Jobson on 13/05/25.
//

enum DataError {
    case invalidData
    case invalidResponse
    case message(_ error: Error?)
}
