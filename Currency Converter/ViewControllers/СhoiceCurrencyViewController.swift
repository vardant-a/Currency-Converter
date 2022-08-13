//
//  СhoiceCurrencyViewController.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import UIKit

class СhoiceCurrencyViewController: UIViewController {
    
    // MARK: Public Properties
    
    var multiplier: Double = 0
    
    var data = ExchangeRates.self
    
    // MARK: Private Properties
    
    private var link = LinkCurrency.usd.rawValue
    
    // MARK: - IB Outlets
    
    @IBOutlet var selectionCurrency: UISegmentedControl!
    @IBOutlet var multiplierTF: UITextField!

    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        NetworkManager.shared.fetch(ExchangeRates.self, from: link) { result in
            switch result {
            case .success(let jsonData):
                print(jsonData)
            case .failure(let error):
                print(error)
            }
        }
        
        guard let tabbarVC = segue.destination as? UITabBarController else { return }
        guard let convectorVC = tabbarVC.viewControllers?.first as? ConvectorViewController else { return }
        convectorVC.multiplier = multiplier
        convectorVC.link = link
        convectorVC.data = data
        
        guard let exchangeRatesVC = tabbarVC.viewControllers?.last as? ExchangeRatesViewController else { return }
        exchangeRatesVC.multiplier = multiplier
        
    }
    
    // MARK: - IB Actions
    
    @IBAction func setSelectionCurrency() {
        switch selectionCurrency.selectedSegmentIndex {
        case 1:
            link = LinkCurrency.eur.rawValue
        case 2:
            link = LinkCurrency.rub.rawValue
        case 3:
            link = LinkCurrency.gpb.rawValue
        case 4:
            link = LinkCurrency.jpy.rawValue
        default:
            link = LinkCurrency.usd.rawValue
        }
        print(link)
    }

    
    @IBAction func testTupped() {
        textFieldDidEndEditing(multiplierTF)
        
        guard multiplier != 0 else {
            showAlert()
            return
        }
        performSegue(withIdentifier: "showTabBar", sender: nil)
    }
    
}

extension СhoiceCurrencyViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let dateTextField = textField.text else { return }
        guard let valueTF = Double(dateTextField) else { return }
        multiplier = valueTF
    }
}

extension СhoiceCurrencyViewController {
    
    private func showAlert() {
        let alert = UIAlertController(
            title: "Warning",
            message: "You do not use the amount of currency. If you continue, the count will be 1",
            preferredStyle: .alert
        )
        
        let nextAction = UIAlertAction(
            title: "Proceed",
            style: .default,
            handler: { _ in
                self.multiplier = 1
                self.performSegue(withIdentifier: "showTabBar", sender: nil)
            }
        )
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .destructive,
            handler: { _ in
                self.multiplierTF.text = ""
            }
        )
        
        alert.addAction(nextAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
