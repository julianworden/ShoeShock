//
//  ViewController.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//

import UIKit

class ShopViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var showCartViewControllerButton: UIBarButtonItem!

    var dataService = DataService.instance
    
    private(set) var cellReuseID = "ShopProductCell"
    private(set) var segueID = "DetailsViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        productCollectionView.dataSource = self
        productCollectionView.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataService.products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseID, for: indexPath) as? ShopProductCollectionViewCell {
            cell.product = dataService.products[indexPath.row]
            return cell
        } else {
            return ShopProductCollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = dataService.products[indexPath.item]
        performSegue(withIdentifier: segueID, sender: product)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsViewController = segue.destination as? DetailsViewController {
            guard let senderAsProduct = sender as? Product else { return }
            detailsViewController.product = senderAsProduct
        }
    }

    @IBAction func unwindFromDetailsViewController(segue: UIStoryboardSegue) {
        
    }
    
}

