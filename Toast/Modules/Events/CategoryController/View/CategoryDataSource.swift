//
//  CategoryDataSource.swift
//  Toast
//
//  Created by Олег Романов on 5/10/21.
//

import UIKit

class CategoryDataSource: NSObject {
    var data: [Category] = []

    var tableView: UITableView

    init(tableView: UITableView) {
        self.tableView = tableView
        tableView.register(CategoryCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension CategoryDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CategoryCell else {
            fatalError("Can't dequeue cell")
        }
        let category = data[indexPath.row]
        cell.configure(category: category)
        return cell
    }
}

extension CategoryDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
}
