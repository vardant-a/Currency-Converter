//
//  ExchangeRates.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import Foundation

struct ExchangeRates: Decodable {
    let result: String
    let timeLastUpdateUtc: String
    let rates: Rate
    
    enum CodingKeys: String, CodingKey {
        case result, rates
        case timeLastUpdateUtc = "time_last_update_utc"
    }
}

struct Rate: Decodable {
    let usd: Double
    let eur: Double
    let rub: Double
    let gbp: Double
    let jpy: Double

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case rub = "RUB"
        case eur = "EUR"
        case gbp = "GBP"
        case jpy = "JPY"
    }
}
