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
        productPriceLabel.text = "$\(product.price)"
        productImage.image = UIImage(named: product.image)
    }

    @IBAction func addProductToCart(_ sender: Any?) {
        let selectedProduct = SelectedProduct(product: product, quantity: 1)
        guard !dataService.cart.contains(selectedProduct) else { return }
        dataService.addSelectedProductToCart(selectedProduct: selectedProduct)
    }
}
