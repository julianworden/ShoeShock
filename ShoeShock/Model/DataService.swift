//
//  Cart.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//

import Foundation

class DataService {

    static var instance = DataService()

    var cart = [SelectedProduct]()
    
    private(set) var products = [
        Product(name: "Black Leather", price: 59.99, image: "BlackLeather", details: "They might be leather, they might not be."),
        Product(name: "Blue Crocodile", price: 199.99, image: "BlueCrocodile", details: "Probably not made from a real crocodile. Not to be confused with Crocs."),
        Product(name: "Blue Suede", price: 149.99, image: "BlueSuede", details: "Pretty sure there was a song named after Blue Suede shoes."),
        Product(name: "Brown Textured", price: 249.99, image: "BrownTextured", details: "These are pretty snazzy."),
        Product(name: "Light Blue Sneaks", price: 49.99, image: "LightBlueSneaks", details: "What all the cool kids are wearing.")
    ]

    var cartTotal: Double {
        var cartTotal = 0.0

        for selectedProduct in cart {
            cartTotal += selectedProduct.totalPrice
        }

        return cartTotal
    }

    func addSelectedProductToCart(selectedProduct: SelectedProduct) {
        cart.append(selectedProduct)
    }
}
