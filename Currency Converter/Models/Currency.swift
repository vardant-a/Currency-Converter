//
//  Currency.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import Foundation


// Забуксовал в модели, подскажите куда ползти, перетыкал всё что только в голову пришло

struct Currency {
    
    let rates: [String: Double]?
    
    init(value: [String: Any]) {
        rates = value["rates"] as? [String: Double]
    }
    
    static func getRate(from value: Any) -> Currency? {
        guard let value = value as? [String: Double] else { return nil }
        return Currency(value: value)
    }
}

struct Rate {
    let rub: Double
    let usd: Double
    let eur: Double
    let gbp: Double
    let jpy: Double
}
