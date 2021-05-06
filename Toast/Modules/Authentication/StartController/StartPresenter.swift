//
//  StartPresenter.swift
//  Toast
//
//  Created by Олег Романов on 3/31/21.
//

import Foundation

final class StartPresenter {
    private weak var view: StartViewInput?

    init(view: StartViewInput) {
        self.view = view
    }
}

extension StartPresenter: StartViewOutput {
    func signInWithEmailTapped() {}
}
