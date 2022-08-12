//
//  СhoiceCurrencyViewController.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import UIKit

class СhoiceCurrencyViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var multiplierTF: UITextField!

    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        NetworkManager.shared.fetch(ExchangeRates.self, from: LinkCurrency.usd.rawValue) { result in
            switch result {
            case .success(let testData):
                print(testData.result)
            case .failure(let error):
                print(error)
            }
        }
        
        guard let tabbarVC = segue.destination as? UITabBarController else { return }
        guard let convectorVC = tabbarVC.viewControllers?.first as? СonvectorViewController else { return }
        convectorVC.testData = 1
        guard let exchangeRatesVC = tabbarVC.viewControllers?.last as? ExchangeRatesViewController else { return }
        exchangeRatesVC.multiplier = 1
        
    }
    
    // MARK: - IB Actions
    
    @IBAction func testTupped() {
        performSegue(withIdentifier: "showTabBar", sender: nil)
    }
    
}
