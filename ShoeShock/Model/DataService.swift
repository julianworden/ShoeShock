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
        Product(name: "Black Leather", price: 59.99, image: "BlackLeather"),
        Product(name: "Blue Crocodile", price: 199.99, image: "BlueCrocodile"),
        Product(name: "Blue Suede", price: 149.99, image: "BlueSuede"),
        Product(name: "Brown Textured", price: 249.99, image: "BrownTextured"),
        Product(name: "Light Blue Sneaks", price: 49.99, image: "LightBlueSneaks")
    ]

    func addSelectedProductToCart(selectedProduct: SelectedProduct) {
        cart.append(selectedProduct)
    }
}
