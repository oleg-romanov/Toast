//
//  PasswordReset.swift
//  Toast
//
//  Created by Олег Романов on 3/31/21.
//

import SnapKit
import UIKit

class PasswordReset: UIView {
    // MARK:

    init() {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {
        setupStyle()
    }

    private func setupStyle() {}
}
