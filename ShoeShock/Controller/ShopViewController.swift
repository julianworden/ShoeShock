//
//  ViewController.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//

import UIKit

class ShopViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var productCollectionView: UICollectionView!

    var dataService = DataService.instance
    private(set) var cellReuseID = "ShopProductCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        productCollectionView.dataSource = self
        productCollectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataService.products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productInRow = dataService.products[indexPath.row]

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseID, for: indexPath) as? ShopProductCollectionViewCell {
            cell.product = productInRow
            return cell
        } else {
            return ShopProductCollectionViewCell()
        }
    }

    
}

