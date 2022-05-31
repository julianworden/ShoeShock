//
//  CartProductTableViewCell.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//


import UIKit

protocol CartProductTableViewCellDelegate {
    func removeRowWithZeroQuantityAt(rowNumber: Int)
    func updateNewCartTotal()
}

class CartProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var quantityStepper: UIStepper!

    let dataService = DataService.instance

    var selectedProduct: SelectedProduct!

    var delegate: CartProductTableViewCellDelegate!

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
        guard var selectedProduct = selectedProduct else { return }

        productQuantityLabel.text = String(Int(quantityStepper.value))
        selectedProduct.changeQuantity(to: Int(quantityStepper.value))
        productPriceLabel.text = "$\(selectedProduct.totalPrice)"

        if selectedProduct.quantity < 1 {
            if let updatedProductRowNumber = dataService.cart.firstIndex(of: selectedProduct) {
                dataService.cart.remove(at: updatedProductRowNumber)
                delegate.removeRowWithZeroQuantityAt(rowNumber: updatedProductRowNumber)
            }
        }

        if let updatedProductIndexPosition = dataService.cart.firstIndex(of: selectedProduct) {
            dataService.cart[updatedProductIndexPosition] = selectedProduct
        }

        delegate.updateNewCartTotal()
    }
}
