//
//  CategoryController.swift
//  Toast
//
//  Created by Олег Романов on 5/10/21.
//

import UIKit

class CategoryController: UIViewController {
    lazy var customView = CategoryView()

    var presenter: CategoryViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = customView
        setupStyle()
    }

    private func setupStyle() {
        navigationItem.title = Text.Categories.title
//        navigationItem.rightBarButtonItem = customView.addPersonButton
    }
}

extension CategoryController: CategoryViewInput {}
