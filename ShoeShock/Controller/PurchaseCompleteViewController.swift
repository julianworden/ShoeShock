//
//  PurchaseCompleteViewController.swift
//  ShoeShock
//
//  Created by Julian Worden on 5/28/22.
//

import UIKit

class PurchaseCompleteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var purchaseCompletedTableView: UITableView!

    var dataService = DataService.instance

    private(set) var cellReuseID = "PurchaseCompletedCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        purchaseCompletedTableView.dataSource = self
        purchaseCompletedTableView.delegate = self
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
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

}
