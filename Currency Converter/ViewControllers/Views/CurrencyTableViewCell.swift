//
//  CurrencyTableViewCell.swift
//  Currency Converter
//
//  Created by Алексей on 14.08.2022.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var imageFlagCurrency: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
