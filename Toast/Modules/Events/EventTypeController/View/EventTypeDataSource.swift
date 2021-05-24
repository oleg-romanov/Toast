//
//  EventTypeDataSource.swift
//  Toast
//
//  Created by Олег Романов on 5/24/21.
//

import UIKit

protocol EventTypeDelegate: AnyObject {
    func sendEventTypeId(categoryId: Int)
}

class EventTypeDataSource: NSObject {
    var data: [EventType] = []

    var oneCellChosen: Bool = false

    var closure: ((Int, String) -> Void)?

    var addEventTypeClosure: (() -> Void)?

    var tableView: UITableView

    init(tableView: UITableView) {
        self.tableView = tableView
        self.tableView.register(UINib(nibName: "EventTypeCell", bundle: .main), forCellReuseIdentifier: "Cell")
//
        super.init()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func updateData(_ data: [EventType]) {
        self.data = data
        tableView.reloadData()
    }
}

extension EventTypeDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? EventTypeCell else {
            fatalError("Can't dequeue cell")
        }
        if indexPath.row < data.count {
            let eventType = data[indexPath.row]
            cell.configure(eventType: eventType)
        } else {
            cell.addEventTypeConfigure()
        }
        return cell
    }
}

extension EventTypeDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)

//        if indexPath.row < tableView.numberOfRows(inSection: 0) - 1 {
//            if cell?.accessoryType != .checkmark, !oneCellChosen {
//                oneCellChosen = true
//                cell?.accessoryType = .checkmark
//                closure?(data[indexPath.row].id, data[indexPath.row].name)
//            } else if cell?.accessoryType == .checkmark {
//                cell?.accessoryType = .none
//                oneCellChosen = false
//            }
//        } else {
//            addEventTypeClosure?()
//        }

        if indexPath.row == tableView.numberOfRows(inSection: 0) - 1 {
            addEventTypeClosure?()
            return
        }

        for row in 0 ..< tableView.numberOfRows(inSection: 0) - 1 {
            let myIndexPath = IndexPath(row: row, section: 0)
            if tableView.cellForRow(at: myIndexPath)?.accessoryType == .checkmark {
                tableView.cellForRow(at: myIndexPath)?.accessoryType = .none
            }
        }

        cell?.accessoryType = .checkmark
        closure?(data[indexPath.row].id, data[indexPath.row].name)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
