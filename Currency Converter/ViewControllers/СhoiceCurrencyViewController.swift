//
//  СhoiceCurrencyViewController.swift
//  Currency Converter
//
//  Created by Алексей on 11.08.2022.
//

import UIKit

class СhoiceCurrencyViewController: UIViewController {
    
    var testArray = [1, 2, 3, 4, 5, 6, 7]
    
    @IBOutlet var testImage: UIImageView!
    @IBOutlet var cardPageControl: UIPageControl! = {
        let pageControll = UIPageControl()
        pageControll.numberOfPages = 5
        return pageControll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func selectionPage(_ sender: UIPageControl) {
        switch sender.currentPage {
        case 0:
            testImage.image = UIImage(named: "eur")
        case 1:
            testImage.image = UIImage(named: "jpy")
        default:
            testImage.image = UIImage(named: "rub")
        }
        
    }
    
}
