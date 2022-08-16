//
//  CardViewController.swift
//  Currency Converter
//
//  Created by Алексей on 16.08.2022.
//

import UIKit

class CardViewController: UIViewController {
    
    var card = Card.getCard().randomElement()


    @IBOutlet var cardImage: UIImageView!
    @IBOutlet var CurrencySelection: UISegmentedControl!
    @IBOutlet var balanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImage.image = UIImage(named: card?.mainImage ?? "")
        balanceLabel.text = "\(card?.balance.rub ?? 0) рублей"

    }
    
    @IBAction func selectionCurrencyBalace(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            balanceLabel.text = "\(card?.balance.rub ?? 0) рублей"
        case 1:
            balanceLabel.text = "\(card?.balance.usd ?? 0) долларов"
        default:
            balanceLabel.text = "\(card?.balance.eur ?? 0) eвро"
        }
        
        
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoBankVC = segue.destination as? DescriptionViewController else { return }
        infoBankVC.infoCard = card?.info
    }
}
