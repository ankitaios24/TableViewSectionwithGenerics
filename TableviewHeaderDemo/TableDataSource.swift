//
//  TableViewHeaderModel.swift
//  TableviewHeaderDemo
//
//  Created by Ankita Thakur on 18/05/24.
//

import UIKit

// Define a model for section
struct Section<Item> {
    var header: String?
    var footer: String?
    var items: [Item]
}

// Define a closure type for cell configuration
typealias CellConfigurator<Item, Cell: UITableViewCell> = (Cell, Item) -> Void

// A generic table view data source using a configuration closure
class TableDataSource<SectionItem, Cell: UITableViewCell>: NSObject, UITableViewDataSource,UITableViewDelegate {
    var sections: [Section<SectionItem>]
    var cellIdentifier: String
    var cellConfigurator: CellConfigurator<SectionItem, Cell>

    init(sections: [Section<SectionItem>], cellIdentifier: String, cellConfigurator: @escaping CellConfigurator<SectionItem, Cell>) {
        self.sections = sections
        self.cellIdentifier = cellIdentifier
        self.cellConfigurator = cellConfigurator
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! Cell
        let item = sections[indexPath.section].items[indexPath.row]
        cellConfigurator(cell, item)
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].header
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footer
    }
}
