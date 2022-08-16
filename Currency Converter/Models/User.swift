//
//  User.swift
//  Currency Converter
//
//  Created by Алексей on 16.08.2022.
//

import Foundation

struct User {
    let firstName: String
    let lastName: String
    let image: String
    let email: String
    let phoneNumber: String
    var fullname: String {
        firstName + " " + lastName
    }
    
    let cards: [Card]
    
    static func getUser() -> User {
        User(
            firstName: "Брюс",
            lastName: "Вэйн",
            image: "bruce",
            email: "batman@gmail.com",
            phoneNumber: "+5-911-911-19-39",
            cards: Card.getCard()
        )
    }
}
