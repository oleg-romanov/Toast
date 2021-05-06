//
//  PasswordResetPresenter.swift
//  Toast
//
//  Created by Олег Романов on 3/31/21.
//

import UIKit

class PasswordResetPresenter {
    private weak var view: PasswordResetViewInput?

    init(view: PasswordResetViewInput) {
        self.view = view
    }
}

extension PasswordResetPresenter: PasswordResetViewOutput {}
