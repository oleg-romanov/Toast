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
        label.text = "Имя пользователя"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = Assets.gray.color
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
        backgroundColor = Assets.background1.color
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(nameLabel)
        addSubview(logoutButton)
    }

    private func makeConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
            make.width.equalTo(UIScreen.main.bounds.width - 32)
        }
        logoutButton.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(80)
            make.width.equalTo(UIScreen.main.bounds.width - 32)
            make.leading.equalTo(16)
            make.height.equalTo(50)
        }
    }
}
