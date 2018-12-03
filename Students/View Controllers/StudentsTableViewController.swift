//
//  StudentsTableViewController.swift
//  Students
//
//  Created by Madison Waters on 9/17/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = students[indexPath.row].name
        
        return cell
    }

    var students: [Student] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

}
