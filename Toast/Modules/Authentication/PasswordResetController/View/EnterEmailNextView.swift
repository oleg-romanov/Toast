//
//  EnterEmailNextView.swift
//  Toast
//
//  Created by Олег Романов on 3/19/21.
//

import SnapKit
import UIKit

class EnterEmailNextView: UIView {
    // MARK: - Properties

    private var textField: UILabel = {
        let label = UILabel()

        return label
    }()

    // MARK: - Init

    init() {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func commonInit() {}
}
