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
    
    var informationCard = Card.getCard().first?.info
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = informationCard?.description
        bikLabel.text = "\(informationCard?.bik ?? 0)"
        innLabel.text = "\(informationCard?.inn ?? 0)"
        kppLabel.text = "\(informationCard?.kpp ?? 0)"
        accountNumber.text = "\(informationCard?.accountNumber ?? 0)"
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
