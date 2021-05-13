//
//  CategoryPresenter.swift
//  Toast
//
//  Created by Олег Романов on 5/10/21.
//

import Foundation

class CategoryPresenter {
    private weak var view: CategoryViewInput?

    init(view: CategoryViewInput) {
        self.view = view
    }
}

extension CategoryPresenter: CategoryViewOutput {}
