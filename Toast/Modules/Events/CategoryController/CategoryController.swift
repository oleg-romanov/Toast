//
//  CategoryController.swift
//  Toast
//
//  Created by Олег Романов on 5/10/21.
//

import UIKit

class CategoryController: UIViewController {
    var customView = CategoryView()

    var presenter: CategoryViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        reloadCategories()
    }

    private func setup() {
        navigationItem.title = Text.Categories.title
//        navigationItem.rightBarButtonItem = customView.addPersonButton
    }
}

extension CategoryController: CategoryViewInput {
    func reloadCategories() {
        presenter?.getAllCategories()
    }

    func loadCategories(categories: [Category]) {
        customView.updateData(categories)
    }
}
