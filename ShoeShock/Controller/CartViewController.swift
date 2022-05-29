//
//  CartViewController.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var cartTableView: UITableView!

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
            cell.update(with: dataService.cart[indexPath.row])
            return cell
        } else {
            return CartProductTableViewCell()
        }
    }

}
