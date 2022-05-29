//
//  SelectedProduct.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//

import Foundation

struct SelectedProduct {
    private(set) var product: Product
    private(set) var quantity: Int

    var totalPrice: Double {
        product.price * Double(quantity)
    }
}
