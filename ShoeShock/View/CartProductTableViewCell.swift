//
//  CartProductTableViewCell.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//

import UIKit

class CartProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var quantityStepper: UIStepper!

    let dataService = DataService.instance

    var selectedProduct: SelectedProduct!

    override func awakeFromNib() {
        super.awakeFromNib()

        quantityStepper.value = 1
    }

    func update(with selectedProduct: SelectedProduct) {
        self.selectedProduct = selectedProduct
        productNameLabel.text = selectedProduct.product.name
        productQuantityLabel.text = String(selectedProduct.quantity)
        productImage.image = UIImage(named: selectedProduct.product.image)
        updateProductQuantityAndPrice()
    }

    @IBAction func stepperPressed(_ sender: Any) {
        updateProductQuantityAndPrice()
    }

    func updateProductQuantityAndPrice() {
        selectedProduct.changeQuantity(to: Int(quantityStepper.value))
        productQuantityLabel.text = String(Int(quantityStepper.value))
        productPriceLabel.text = String(selectedProduct.totalPrice)

        if let selectedProductIndexPosition = dataService.cart.firstIndex(of: selectedProduct) {
            dataService.cart[selectedProductIndexPosition].changeQuantity(to: selectedProduct.quantity)
            print(dataService.cart[selectedProductIndexPosition])
        }
    }
}
