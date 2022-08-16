//
//  RatesViewController.swift
//  Currency Converter
//
//  Created by Алексей on 16.08.2022.
//

import UIKit

class RatesViewController: UITableViewController {
    
    let testCard = Card.getCard()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source


//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        testCard.count
//    }
    
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ratesCell", for: indexPath)
//        let card = testCard[indexPath.row]
//        var contentCell = cell.defaultContentConfiguration()
//        
//        
////        contentCell.image = UIImage(named: card.mainImage)
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
