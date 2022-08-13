//
//  InfoListViewController.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import UIKit

class InfoListViewController: UITableViewController {

    private var infoList = Currency.getInfoList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        infoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "сurrency", for: indexPath)
        let currency = infoList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = currency.designation
        content.textProperties.font = UIFont.boldSystemFont(ofSize: 15)
        content.secondaryText = currency.info
        content.image = UIImage(named: currency.image)
        content.imageProperties.cornerRadius = 12
        cell.contentConfiguration = content
        return cell
    }

}

extension InfoListViewController {
    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
