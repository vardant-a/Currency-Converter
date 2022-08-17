//
//  RatesViewController.swift
//  Currency Converter
//
//  Created by Алексей on 16.08.2022.
//

import UIKit

class RatesViewController: UITableViewController {
    
    @IBOutlet var multiplierTextField: UITextField!
    
//    let testCard = 
    var multiplier: Double = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        testCard.keys.count()
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "rateCell", for: indexPath)
//        let card = testCard[indexPath.row]
//        var contentCell = cell.defaultContentConfiguration()
//
//
//
//        contentCell.text = card.bank
//        contentCell.secondaryText = card.date
//
//        cell.contentConfiguration = contentCell
//        return cell
//    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
        //func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    //}

}

extension RatesViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let dateTextField = textField.text else { return }
        guard let valueTF = Double(dateTextField) else { return }
        multiplier = valueTF
    }
}
