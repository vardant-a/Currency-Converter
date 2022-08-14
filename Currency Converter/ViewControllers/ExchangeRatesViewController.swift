//
//  ExchangeRatesViewController.swift
//  Currency Converter
//
//  Created by Алексей on 12.08.2022.
//

import UIKit

class ExchangeRatesViewController: UITableViewController {
    
    var multiplier: Double!
    var indexCurrency: Int!
    var valueCurrency = Rate(usd: 0, eur: 0, rub: 0, gbp: 0, jpy: 0)
    
    private var valueList = Currency.getInfoList()
    private var currencyValues: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Множитель \(multiplier ?? 0)")
        tableView.rowHeight = 90
        
        getValueList()
        print(valueCurrency)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        valueList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exchangeCurrency", for: indexPath)
        let currency = valueList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = currency.designation
        content.textProperties.font = UIFont.boldSystemFont(ofSize: 15)
        content.secondaryText = "При обмене 1 \(valueList[indexCurrency].name) вы получите - \(String(format: "%.2f", currencyValues[indexPath.row])) \(currency.name)"
        content.image = UIImage(named: currency.image)
        content.imageProperties.cornerRadius = 12
        cell.contentConfiguration = content
        return cell
    }
    
}

extension ExchangeRatesViewController {
    
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
    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

