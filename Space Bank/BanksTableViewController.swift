//
//  BanksTableViewController.swift
//  Space Bank
//
//  Created by Tanya Tomchuk on 08/09/2017.
//  Copyright © 2017 Tanya Tomchuk. All rights reserved.
//

import UIKit

class BanksTableViewController: UITableViewController {
    var banks = [BanksData]()
//    let spinner = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
//        spinner.hidesWhenStopped = true
//        spinner.center = tableView.center
//        spinner.activityIndicatorViewStyle = .gray
//        spinner.startAnimating()
//        tableView.addSubview(spinner)
        
        NetworkManager.shared.getBanks { (banks: [BanksData]) -> Void in
            self.banks = banks
//            self.spinner.stopAnimating()
//            self.spinner.removeFromSuperview()
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return banks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BankTableViewCell

        // Configure the cell...
        cell.bankName?.text = banks [indexPath.row].name
        cell.bankAddress?.text = banks [indexPath.row].address
        cell.bankSchedule?.text = banks [indexPath.row].schedule

        return cell
    }
}
