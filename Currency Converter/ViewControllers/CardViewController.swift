//
//  CardViewController.swift
//  Currency Converter
//
//  Created by Алексей on 16.08.2022.
//

import UIKit

class CardViewController: UIViewController {
    
    let card = Card.getCard().randomElement()


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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
