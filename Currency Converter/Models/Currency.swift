//
//  Currency.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import Foundation

struct Currency {
    let name: 
    let name: String
    let info: String
    let designation: String
    let image: String
    let value: Double = 1
    
    static func getInfoList() -> [Currency] {
        var infoListOfСurrency: [Currency] = []
        let iterationCount = min(
            CurrencyDescription.shared.named.count,
            CurrencyDescription.shared.designations.count,
            CurrencyDescription.shared.informations.count
            )
        
        for index in 0..<iterationCount {
            infoListOfСurrency.append(
                Currency(
                    name: CurrencyDescription.shared.named[index],
                    info: CurrencyDescription.shared.informations[index],
                    designation: CurrencyDescription.shared.designations[index],
                    image: CurrencyDescription.shared.images[index]
                )
            )
        }
                return infoListOfСurrency
    }
}
