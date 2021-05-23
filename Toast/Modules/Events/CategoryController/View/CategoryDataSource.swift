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

    var oneCellChosen: Bool = false

    var closure: ((Int, String) -> Void)?

    var addCategoryClosure: (() -> Void)?

    var tableView: UITableView

    init(tableView: UITableView) {
        self.tableView = tableView
        self.tableView.register(UINib(nibName: "CategoryCell", bundle: .main), forCellReuseIdentifier: "Cell")
//
        super.init()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func updateData(_ data: [Category]) {
        self.data = data
        tableView.reloadData()
    }
}

extension CategoryDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CategoryCell else {
            fatalError("Can't dequeue cell")
        }
        if indexPath.row < data.count {
            let category = data[indexPath.row]
            cell.configure(category: category)
        } else {
            cell.addCategoryConfigure()
        }
        return cell
    }
}

extension CategoryDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)

        if indexPath.row < tableView.numberOfRows(inSection: 0) - 1 {
            if cell?.accessoryType != .checkmark, !oneCellChosen {
                oneCellChosen = true
                cell?.accessoryType = .checkmark
                closure?(data[indexPath.row].id, data[indexPath.row].name)
            } else if cell?.accessoryType == .checkmark {
                cell?.accessoryType = .none
                oneCellChosen = false
            }
        } else {
            addCategoryClosure?()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
