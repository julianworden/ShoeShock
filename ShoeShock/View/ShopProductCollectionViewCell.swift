//
//  ShopProductCollectionViewCell.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//

import UIKit

class ShopProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!

    let dataService = DataService.instance

    var product: Product! {
        didSet {
            update(with: product)
        }
    }

    func update(with product: Product) {
        productNameLabel.text = product.name
        productPriceLabel.text = String(product.price)
        productImage.image = UIImage(named: product.image)
    }

    // Should this @IBAction function go in the ShopViewController somehow?
    // Or is it all right to put it in the ShopProductCollectionViewCell like this?

    @IBAction func addProductToCart(_ sender: Any?) {
        let selectedProduct = SelectedProduct(product: product, quantity: 1)
        dataService.addSelectedProductToCart(selectedProduct: selectedProduct)
    }
}
