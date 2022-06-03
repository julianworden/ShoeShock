//
//  CartProductTableViewCell.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//


import UIKit

// This is the first time I've ever used
// a delegate like this, and I'd appreciate
// some input on how I did! Not sure if there
// is a better way to integrate this functionality,
// or if it makes sense to use a delegate here.
// Also, I feel like I have too much logic
// in this view overall and that it should be
// split up elsewhere? Thoughts?

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
    var delegate: CartProductTableViewCellDelegate!

    var selectedProduct: SelectedProduct!

    override func awakeFromNib() {
        super.awakeFromNib()

        quantityStepper.value = 1
    }

    @IBAction func stepperPressed(_ sender: Any) {
        updateProductQuantityAndPrice()
    }

    func update(with selectedProduct: SelectedProduct) {
        self.selectedProduct = selectedProduct
        productNameLabel.text = selectedProduct.product.name
        productQuantityLabel.text = String(selectedProduct.quantity)
        productImage.image = UIImage(named: selectedProduct.product.image)
        updateProductQuantityAndPrice()
    }

    func updateProductQuantityAndPrice() {
        
        productQuantityLabel.text = String(Int(quantityStepper.value))
        selectedProduct.changeQuantity(to: Int(quantityStepper.value))
        productPriceLabel.text = "$\(selectedProduct.totalPrice.formatted())"

        if selectedProduct.quantity < 1 {
            if let updatedProductRowNumber = dataService.cart.firstIndex(of: selectedProduct) {
                dataService.cart.remove(at: updatedProductRowNumber)
                delegate.removeRowWithZeroQuantityAt(rowNumber: updatedProductRowNumber)
            }
        } else {
            if let updatedProductIndexPosition = dataService.cart.firstIndex(of: selectedProduct) {
                dataService.cart[updatedProductIndexPosition] = selectedProduct
            }
        }

        delegate.updateNewCartTotal()
    }
}
