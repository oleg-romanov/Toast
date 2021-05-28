//
//  ProfileView.swift
//  Toast
//
//  Created by Олег Романов on 5/27/21.
//

import SnapKit
import UIKit

class ProfileView: UIView {
    // MARK: - Properties

    var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    var logoutButton = ButtonSecondary(title: "Выйти")

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
    }

    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(logoutButton)
    }

    private func makeConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalToSuperview()
        }
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(60)
            make.width.equalTo(UIScreen.main.bounds.width - 32)
            make.centerX.equalToSuperview()
        }
    }
}
