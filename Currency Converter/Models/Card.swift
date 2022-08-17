//
//  Card.swift
//  Currency Converter
//
//  Created by Алексей on 16.08.2022.
//

import Foundation

struct Card {
    let bank: String
    let mainImage: String
    let balance: Balance
    let info: Info
    let commission: Double
    
    static func getCard() -> [Card] {
        return [
            Card(
                bank: "Сбербанк",
                mainImage: "sber",
                balance: Balance(
                    rub: 14374,
                    usd: 28.6,
                    eur: 11.16
                ),
                info: Info(
                    description: "Сбербанк ПАО г. Москва",
                    bik: 044525225,
                    inn: 7707083893,
                    kpp: 773643002,
                    accountNumber: 8129434458
                ),
                commission: 0.15
            ),
            Card(
                bank: "Альфабанк",
                mainImage: "alfa",
                balance:
                    Balance(
                        rub: 3924.7,
                        usd: 472.11,
                        eur: 300
                    ),
                info: Info(
                    description: "АО «Альфа-Банк», г. Москва",
                    bik: 044525593,
                    inn: 7728168971,
                    kpp: 770801001,
                    accountNumber: 0540349129
                ),
                commission: 0.9
            ),
            Card(
                bank: "Газпромбанк",
                mainImage: "gzp",
                balance: Balance(
                    rub: 31964.14,
                    usd: 1285,
                    eur: 6
                ),
                info: Info(
                    description: "Банк ГПБ (АО), г. Москва",
                    bik: 044525823,
                    inn: 7744001497,
                    kpp: 772801001,
                    accountNumber: 4021857711
                ),
                commission: 0.3
            )
        ]
    }
}


struct Balance {
    var rub: Double = 0
    var usd: Double = 0
    var eur: Double = 0
    
    static func getBalance() -> Balance {
        let balanceCard = Balance()
        return balanceCard
    }
}

struct Info {
    let description: String
    let bik: Int
    let inn: Int
    let kpp: Int
    let accountNumber: Int
}
