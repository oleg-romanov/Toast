//
//  CategoryView.swift
//  Toast
//
//  Created by Олег Романов on 5/10/21.
//

import SnapKit
import UIKit

// Чисто для теста
import SPAlert

class CategoryView: UIView {
    // MARK: - Properties

    lazy var addEventButton = UIBarButtonItem(
        barButtonSystemItem: .add, target: nil, action: nil
    )

    lazy var searchBarItem = UISearchBar()

    private var tableView: UITableView = {
        let tableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
        return tableView
    }()

    lazy var dataSource = CategoryDataSource(tableView: tableView)

    lazy var delegate = CategoryDataSource(tableView: tableView)

    // MARK: - Init

    init() {
        super.init(frame: UIScreen.main.bounds)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(tableView)
    }

    private func makeConstraints() {}

    func updateData(_ categories: [Category]) {
        dataSource.updateData(categories)
    }
}