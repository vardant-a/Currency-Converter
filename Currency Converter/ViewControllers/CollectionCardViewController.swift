//
//  CollectionCardViewController.swift
//  Currency Converter
//
//  Created by Алексей on 16.08.2022.
//

import UIKit

class CollectionCardViewController: UIViewController {
    
    @IBOutlet var cardCollectionView: UICollectionView!
    @IBOutlet var cardPageControl: UIPageControl!
    
    let cards = Card.getCard()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(cards)
        
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
    }
    
    //MARK: - Navigation
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        guard let cardVC = segue.destination as? CardViewController else { return }
    //////         guard let coctail = sender as? Coctail else { return }
    ////         coctailVC.coctail = coctail
    //
    //    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let card = cards[indexPath.item]
        performSegue(withIdentifier: "showCard", sender: card)
    }
    
}

extension CollectionCardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = cardCollectionView.dequeueReusableCell(
                withReuseIdentifier: "cardCell",
                for: indexPath
            ) as? CardCollectionViewCell else { return UICollectionViewCell() }
        let card = cards[indexPath.item]
        cell.imageCardCollection.image = UIImage(named: card.mainImage)
        return cell
    }
}
