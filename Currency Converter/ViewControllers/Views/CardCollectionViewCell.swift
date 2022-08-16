//
//  CardCollectionViewCell.swift
//  Currency Converter
//
//  Created by Алексей on 16.08.2022.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageCardCollection: UIImageView!
    
    //MARK: - Override Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 9
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 8)
        
        self.clipsToBounds = false
    }
    
    
    //MARK: - Public Methods
}
