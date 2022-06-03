//
//  DetailsViewController.swift
//  ShoeShock
//
//  Created by Julian Worden on 6/1/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!

    var product: Product!

    let dataService = DataService.instance

    override func viewDidLoad() {
        super.viewDidLoad()

        update(with: product)
    }

    func update(with product: Product) {
        productImage.image = UIImage(named: product.image)
        productName.text = product.name
        productDescription.text = product.details
        productPrice.text = String(product.price)
    }

    @IBAction func addProductToCart(_ sender: Any?) {
        let selectedProduct = SelectedProduct(product: product, quantity: 1)

        if let selectedProductIndexPosition = dataService.cart.firstIndex(of: selectedProduct) {
            dataService.cart[selectedProductIndexPosition].changeQuantity(to: selectedProduct.quantity + 1)
        } else {
            dataService.addSelectedProductToCart(selectedProduct: selectedProduct)
        }
    }

}
