//
//  PurchaseCompletedTableViewCell.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/30/22.
//

import UIKit

class PurchaseCompletedTableViewCell: UITableViewCell {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productQuantity: UILabel!

    let dataService = DataService.instance

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func update(with selectedProduct: SelectedProduct) {
        productName.text = selectedProduct.product.name
        productPrice.text = "Price: $\(selectedProduct.totalPrice)"
        productQuantity.text = "Quantity: \(selectedProduct.quantity)"
    }

}
