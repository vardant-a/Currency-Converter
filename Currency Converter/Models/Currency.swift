//
//  Currency.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import Foundation

struct Currency {
    let designation: String
    let description: String
    let image: String
    
    static func getInfoList() -> [Currency] {
        var infoListOfСurrency: [Currency] = []
        let iterationCount = min(CurrencyDescription.shared.designations.count, CurrencyDescription.shared.descriptions.count)
        
        for index in 0..<iterationCount {
            infoListOfСurrency.append(
                Currency(
                    designation: CurrencyDescription.shared.designations[index],
                    description: CurrencyDescription.shared.descriptions[index],
                    image: CurrencyDescription.shared.images[index]
                )
            )
        }
                return infoListOfСurrency
    }
}
