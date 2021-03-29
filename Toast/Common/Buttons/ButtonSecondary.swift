//
//  ButtonSecondary.swift
//  Toast
//
//  Created by Олег Романов on 27.07.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

class ButtonSecondary: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setupStyle(title: title)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle(title: String) {
        setTitle(title, for: .normal)
        setTitleColor(Assets.lightgray.color, for: .normal)
        backgroundColor = Assets.background1.color
        layer.cornerRadius = 14
        layer.borderColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        layer.borderWidth = 1
    }
}
