//
//  DescriptionViewController.swift
//  Currency Converter
//
//  Created by Алексей on 16.08.2022.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var bikLabel: UILabel!
    @IBOutlet var innLabel: UILabel!
    @IBOutlet var kppLabel: UILabel!
    @IBOutlet var accountNumber: UILabel!
    
    var infoCard = Card.getCard().first?.info
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = infoCard?.description
        bikLabel.text = "\(infoCard?.bik ?? 0)"
        innLabel.text = "\(infoCard?.inn ?? 0)"
        kppLabel.text = "\(infoCard?.kpp ?? 0)"
        accountNumber.text = "\(infoCard?.accountNumber ?? 0)"
    }
    @IBAction func tuppedButtonCOPY() {
        let alert = UIAlertController(
            title: "Уведомление!",
            message: "Реквизиты банков подленные, правда счета придуманы...)",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
