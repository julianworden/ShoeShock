//
//  RoundedBlackButton.swift
//  ShoeShock
//
//  Created by Julian Worden on 6/1/22.
//

import UIKit

@IBDesignable
class RoundedBlackButton: UIButton {

    override func prepareForInterfaceBuilder() {
        makeRoundedCorners()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        makeRoundedCorners()
    }

    func makeRoundedCorners() {
        layer.cornerRadius = 15
        clipsToBounds = false
    }

}
