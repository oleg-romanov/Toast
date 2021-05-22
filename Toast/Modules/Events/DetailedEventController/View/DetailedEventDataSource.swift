//
//  DetailedEventDataSource.swift
//  Toast
//
//  Created by Олег Романов on 5/22/21.
//

import UIKit

class DetailedEventDataSource: NSObject, UITableViewDataSource { // MARK: - Properties
    private var data: [[Event]] = []
    private var tableView: UITableView?

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension DetailedEventDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
