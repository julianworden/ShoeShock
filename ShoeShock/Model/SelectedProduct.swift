//
//  SelectedProduct.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//

import Foundation

struct SelectedProduct: Equatable {
    private(set) var product: Product
    private(set) var quantity: Int

    var totalPrice: Double {
        product.price * Double(quantity)
    }

    static func ==(lhs: SelectedProduct, rhs: SelectedProduct) -> Bool {
        lhs.product.name == rhs.product.name
    }

    mutating func changeQuantity(to quantity: Int) {
        self.quantity = quantity
    }
    
}
