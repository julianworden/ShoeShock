//
//  CartViewController.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // TRY PUTTING STEPPER FUNCTIONALITY IN THIS FILE INSTEAD OF THE CELL FILE!!
    // ALSO UPDATE DATASERVICE.CART HERE INSTEAD OF FROM WITHIN THE CELL!!

    @IBOutlet var cartTableView: UITableView!
    @IBOutlet weak var cartTotalLabel: UILabel!
    @IBOutlet weak var completePurchaseButton: RoundedBlackButton!

    private(set) var cellReuseID = "CartProductCell"

    var dataService = DataService.instance

    override func viewDidLoad() {
        super.viewDidLoad()

        cartTableView.dataSource = self
        cartTableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataService.cart.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as? CartProductTableViewCell {
            let cartProduct = dataService.cart[indexPath.row]

            cell.delegate = self
            cell.update(with: cartProduct)
            cell.selectedProduct = cartProduct
            return cell
        } else {
            return CartProductTableViewCell()
        }
    }

    @IBSegueAction func showPurchaseCompleteViewController(_ coder: NSCoder) -> PurchaseCompleteViewController? {
        return PurchaseCompleteViewController(coder: coder)
    }
}

extension CartViewController: CartProductTableViewCellDelegate {
    func removeRowWithZeroQuantityAt(rowNumber: Int) {
        let cartProductIndexPath = IndexPath(item: rowNumber, section: 0)
        cartTableView.deleteRows(at: [cartProductIndexPath], with: .automatic)
    }

    func updateNewCartTotal() {
        cartTotalLabel.text = String(dataService.cartTotal.formatted())
    }
}
