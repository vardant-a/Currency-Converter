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
    
    private var valueList = Currency.getInfoList()
    private var currencyValues: [Double] = [0.1111, 0.2222, 0.3333, 0.4444, 0.5555]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Множитель \(multiplier ?? 0)")
        tableView.rowHeight = 90
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
    
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

