//
//  СhoiceCurrencyViewController.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import UIKit

class СhoiceCurrencyViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet var imageCurrency: UIImageView!
    @IBOutlet var selectionCurrency: UISegmentedControl!
    @IBOutlet var multiplierTF: UITextField!
    
    // MARK: Public Properties
    
    var multiplier: Double = 0
    var indexCurrency = 0
    var valueCurrency = Rate(usd: 0, eur: 0, rub: 0, gbp: 0, jpy: 0)
    
    // MARK: Private Properties
    
    private var link = LinkCurrency.usd.rawValue
    private let valueList = Currency.getInfoList()

    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabbarVC = segue.destination as? UITabBarController else { return }
        guard let convectorVC = tabbarVC.viewControllers?.first as? ConvectorViewController else { return }
        convectorVC.multiplier = multiplier
        convectorVC.indexCurrency = indexCurrency
        convectorVC.valueCurrency = valueCurrency
        
        guard let exchangeRatesVC = tabbarVC.viewControllers?.last as? ExchangeRatesViewController else { return }
        exchangeRatesVC.multiplier = multiplier
        exchangeRatesVC.indexCurrency = indexCurrency
        exchangeRatesVC.valueCurrency = valueCurrency
    }
    
    // MARK: - IB Actions
    
    @IBAction func setSelectionCurrency() {
        switch selectionCurrency.selectedSegmentIndex {
        case 0:
            indexCurrency = 0
            imageCurrency.image = UIImage(named: valueList[indexCurrency].image)
            link = LinkCurrency.usd.rawValue
            
        case 1:
            indexCurrency = 1
            imageCurrency.image = UIImage(named: valueList[indexCurrency].image)
            link = LinkCurrency.eur.rawValue
        case 2:
            indexCurrency = 2
            imageCurrency.image = UIImage(named: valueList[indexCurrency].image)
            link = LinkCurrency.rub.rawValue
        case 3:
            indexCurrency = 3
            imageCurrency.image = UIImage(named: valueList[indexCurrency].image)
            link = LinkCurrency.gpb.rawValue
        default:
            indexCurrency = 4
            imageCurrency.image = UIImage(named: valueList[indexCurrency].image)
            link = LinkCurrency.jpy.rawValue
        }
    }

    
    @IBAction func convertButtonTupped() {
        textFieldDidEndEditing(multiplierTF)
        
        guard multiplier != 0 else {
            showAlert()
            return
        }
        
        NetworkManager.shared.fetch(ExchangeRates.self, from: link) { result in
            switch result {
            case .success(let jsonData):
                self.valueCurrency = jsonData.rates
                print(self.valueCurrency)
            case .failure(let error):
                print(error)
            }
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
            title: "Предупреждение",
            message: "Вы не указали колличество валюты. Продолжая, расчёты будут вестись для 1 условной единицы",
            preferredStyle: .alert
        )
        
        let nextAction = UIAlertAction(
            title: "Продолжить",
            style: .default,
            handler: { _ in
                self.multiplier = 1
                self.performSegue(withIdentifier: "showTabBar", sender: nil)
            }
        )
        let cancelAction = UIAlertAction(
            title: "Отмена",
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
