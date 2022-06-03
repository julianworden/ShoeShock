//
//  PurchaseCompleteViewController.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//

import UIKit

class PurchaseCompleteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var purchaseCompletedTableView: UITableView!
    @IBOutlet weak var cartTotalLabel: UILabel!
    @IBOutlet weak var purchaseTotalTextLabel: UILabel!
    @IBOutlet weak var thankYouLabel: UILabel!

    var dataService = DataService.instance

    private(set) var cellReuseID = "PurchaseCompletedCell"

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        purchaseCompletedTableView.dataSource = self
        purchaseCompletedTableView.delegate = self

        setMessageText()

        cartTotalLabel.text = String(dataService.cartTotal)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataService.cart.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as? PurchaseCompletedTableViewCell {
            cell.update(with: dataService.cart[indexPath.row])
            return cell
        } else {
            return PurchaseCompletedTableViewCell()
        }
    }

    func setMessageText() {
        if dataService.cart.isEmpty {
            thankYouLabel.text = "Invalid order, your cart is empty!"
            cartTotalLabel.isHidden = true
            purchaseTotalTextLabel.isHidden = true
        } else {
            thankYouLabel.text = "Thank you for your purchase! The following order has been placed:"
        }
    }

}
