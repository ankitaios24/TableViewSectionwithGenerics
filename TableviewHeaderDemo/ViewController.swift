//
//  ViewController.swift
//  TableviewHeaderDemo
//
//  Created by Ankita Thakur on 18/05/24.
//

import UIKit

class ViewController: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var tableView: UITableView!
    //MARK:- Variable
    var dataSource: TableDataSource<String, UITableViewCell>!
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        handleTableView()
        // Do any additional setup after loading the view.
    }
    //MARK:- Custom Functions
    func handleTableView(){
        // Define some sections
        let sections: [Section<String>] = [
            Section(header: "Header 1", footer: "Footer 1", items: ["Item 1", "Item 2"]),
            Section(header: "Header 2", footer: "Footer 2", items: ["Item 3", "Item 4"])
        ]
        // Register the cell
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")

        // Cell configurator closure
        let cellConfigurator: CellConfigurator<String, UITableViewCell> = { cell, item in
            cell.textLabel?.text = item
        }
        // Initialize the table handler with all configurations
       dataSource = TableDataSource(sections: sections, cellIdentifier: "CustomTableViewCell", cellConfigurator: cellConfigurator)
        // Register the data source with a table view
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        tableView.reloadData()
    }
    
   

}

// MARK:- Cell
class CustomTableViewCell: UITableViewCell {
  
}
