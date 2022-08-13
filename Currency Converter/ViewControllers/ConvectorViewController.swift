//
//  ConvectorViewController.swift
//  Currency Converter
//
//  Created by Алексей on 13.08.2022.
//

import UIKit

class ConvectorViewController: UIViewController {
    
    var multiplier: Double!
    var link = ""
    var data = ExchangeRates.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Данные - \(multiplier ?? 0)")
        print("ссылка - \(link)")
        print(data)
    }
}
