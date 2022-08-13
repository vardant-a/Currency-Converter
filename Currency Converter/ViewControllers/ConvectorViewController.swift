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
    var data = [Rate]?.self
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        print("Множитель - \(multiplier ?? 1)")
        print("Индекс - \(indexCurrency ?? 0)")
    }
    
    @IBAction func tuppedButtonConvect() {
        showAlert()
    }
    
}

extension ConvectorViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell") as! CurrencyTableViewCell
        cell.nameLabel.text = "test"
        cell.descriptionLabel.text = "test 2"
        return cell
    }
    
}
extension ConvectorViewController {
    private func showAlert() {
        let alert = UIAlertController(
            title: "Warning",
            message: "Make a currency exchange?",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        )
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .destructive,
            handler: nil
        )
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

}
