//
//  СhoiceCurrencyViewController.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import UIKit

class СhoiceCurrencyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetch(ExchangeRates.self, from: Link.usd.rawValue) { result in
            switch result {
            case .success(let testData):
                print(testData.result)
            case .failure(let error):
                print(error)
            }
        }
    }
}
