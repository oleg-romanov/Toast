//
//  CategoryDataSource.swift
//  Toast
//
//  Created by Олег Романов on 5/10/21.
//

import UIKit

protocol CategoryDelegate: AnyObject {
    func sendCategoryId(categoryId: Int)
}

class CategoryDataSource: NSObject {
    var data: [Category] = []

    var closure: ((Int) -> Void)?

    var tableView: UITableView

    init(tableView: UITableView) {
        self.tableView = tableView
        tableView.register(UINib(nibName: "CategoryCell", bundle: .main), forCellReuseIdentifier: "Cell")
    }

    func updateData(_ data: [Category]) {
        self.data = data
        tableView.reloadData()
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
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType != .checkmark {
            cell?.accessoryType = .checkmark
            if let closure = closure {
                closure(data[indexPath.row].id)
            }
        } else if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
