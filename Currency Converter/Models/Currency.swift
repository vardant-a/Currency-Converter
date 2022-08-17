//
//  Currency.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import Foundation


// Забуксовал в модели, подскажите куда ползти, перетыкал всё что только в голову пришло

struct Currency {
    
    let rates: [String: Rate]?
    
    init(rates: [String: Rate]) {
        self.rates = rates
    }
    
    static func getRate(from value: Any) -> [String: Rate] {
        guard let disclosedData = value as? [String: Any] else { return [:]}
        var dataRate = [String: Rate]()
        
        for elementData in disclosedData {
            guard let elementDataRage = elementData.value as? [String: Rate] else { return [:] }

            dataRate[elementData.key] = Rate(
                rub: elementDataRage["RUB"] as? Double ?? 0,
                usd: elementDataRage["USD"] as? Double ?? 0,
                eur: elementDataRage["EUR"] as? Double ?? 0,
                gbp: elementDataRage["GBP"] as? Double ?? 0,
                jpy: elementDataRage["JPY"] as? Double ?? 0
            )
        }
        return dataRate
    }
}

struct Rate {
    let rub: Double
    let usd: Double
    let eur: Double
    let gbp: Double
    let jpy: Double
}
