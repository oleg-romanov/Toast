//
//  DetailedEventView.swift
//  Toast
//
//  Created by Олег Романов on 5/22/21.
//

import SnapKit
import UIKit

class DetailedEventView: UIView {
    // MARK: - Properties

    private var datePlaceholderLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private var dateLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private var participantsLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    // MARK: - Init

    init() {
        super.init(frame: UIScreen.main.bounds)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubviews()
        makeConstraints()
        addActionHandlers()
    }

    private func addSubviews() {
        addSubview(tableView)
    }

    private func makeConstraints() {}

    private func addActionHandlers() {}
}
