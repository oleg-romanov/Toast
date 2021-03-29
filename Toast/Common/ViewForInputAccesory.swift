//
//  ViewForInputAccesory.swift
//  Toast
//
//  Created by Олег Романов on 3/19/21.
//

import UIKit

class ViewForInputAccesory: UIView {
    // MARK: Properties

    private var button: ButtonDefault

    // MARK: Init

    init(title: String) {
        self.button = ButtonDefault(title: title)
        super.init(frame: CGRect(width: UIScreen.main.bounds.width, height: 74))
        setupStyle()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle() {
        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        addSubview(button)
    }

    private func makeConstraints() {
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width - 32)
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(44)
        }
    }
}
