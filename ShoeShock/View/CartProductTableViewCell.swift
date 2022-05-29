//
//  CartProductTableViewCell.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//

import UIKit

class CartProductTableViewCell: UITableViewCell {

    @IBOutlet var productNameLabel: UILabel!
    @IBOutlet var productQuantityLabel: UILabel!
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var quantityStepper: UIStepper!

    var selectedProduct: SelectedProduct! {
        didSet {
            update(with: selectedProduct)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with selectedProduct: SelectedProduct) {
        productNameLabel.text = selectedProduct.product.name
        productQuantityLabel.text = String(selectedProduct.quantity)
        productImage.image = UIImage(named: selectedProduct.product.image)
    }

}
