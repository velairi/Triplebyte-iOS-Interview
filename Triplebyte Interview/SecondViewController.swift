//
//  SecondViewController.swift
//  Triplebyte Interview
//
//  Created by Valerie Don on 2/18/19.
//  Copyright © 2019 Valerie Don. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let transactions = ["Dinner at Momo's", "Lunch at Pete's", "Whole Foods", "Safeway", "Safeway", "Uber"]
    let dates = ["7/28/17", "8/12/17", "9/28/17", "10/28/17", "11/28/17", "12/28/17"]
    let prices = ["15.85", "16.85", "20.85", "60.85", "35.85", "12.85"]

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TransactionCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TransactionCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell") as! TransactionCell
        cell.transactionLabel?.text = transactions[indexPath.item]
        cell.priceLabel.text = prices[indexPath.item]
        cell.dateLabel.text = dates[indexPath.item]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath) as! TransactionCell
    }
}
