//
//  ConvectorViewController.swift
//  Currency Converter
//
//  Created by Алексей on 13.08.2022.
//

import UIKit

class ConvectorViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var multiplier: Double!
    var indexCurrency: Int!
    var valueCurrency = Rate(usd: 0, eur: 0, rub: 0, gbp: 0, jpy: 0)
    
    private var valueList = Currency.getInfoList()
    private var currencyValues: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        print("Множитель - \(multiplier ?? 1)")
        print("Индекс - \(indexCurrency ?? 0)")
        getValueList()
        
    }
    
}

extension ConvectorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currencyValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell") as! CurrencyTableViewCell
        let currency = valueList[indexPath.row]

        cell.nameLabel.text = currency.name
        cell.descriptionLabel.text = "Обменять \(multiplier ?? 1) \(valueList[indexCurrency].name) на \(String(format: "%.2f", multiplier * currencyValues[indexPath.row])) \(currency.name)"
        cell.imageFlagCurrency.image = UIImage(named: currency.image)
        cell.imageFlagCurrency.layer.cornerRadius = 40

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showAlert()
    }
    
}
extension ConvectorViewController {
    
    private func getValueList() {
        /* не хватило мозгов, чтобы добавить не в ручную, если подскажите куда копать,
         чтобы можно было не вручную добавлять свойства экземпляра в цикл - буду признателен.
         */
        currencyValues.append(valueCurrency.usd)
        currencyValues.append(valueCurrency.eur)
        currencyValues.append(valueCurrency.rub)
        currencyValues.append(valueCurrency.gbp)
        currencyValues.append(valueCurrency.jpy)
    }
    
    private func showAlert() {
        let alert = UIAlertController(
            title: "Внимание",
            message: "Произвести конвертирование?",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        )
        let cancelAction = UIAlertAction(
            title: "Отмена",
            style: .destructive,
            handler: nil
        )
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

}
