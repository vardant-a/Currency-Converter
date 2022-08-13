//
//  CurrencyDescription.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import Foundation

class CurrencyDescription {
    
    static let shared = CurrencyDescription()
    
    let named = ["USD", "EUR", "RUB", "GPB", "JPY"]
    let  designations = ["Доллар США", "Евро", "Российский рубль",
                         "Фунт стерлингов", "Иена"]
    let images = ["usd", "eur", "rub", "gpb","jpy"]
    let informations = [
        "Денежная единица Соединенных Штатов Америки, подробнее...",
        "Денежная единица 19 стран «еврозоны», подробнее...",
        "Денежная единица Российской Федерации, подробнее...",
        "Денежная единица Соединённого Королевства Великобритании и Северной Ирландии, подробнее...",
        "Денежная единица Японии, одна из основных резервных валют мира, подробнее..."
    ]
    private init() {}
}
