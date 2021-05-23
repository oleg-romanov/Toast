//
//  AddCategoryController.swift
//  Toast
//
//  Created by Олег Романов on 5/23/21.
//

import UIKit

class AddCategoryController: UIViewController {
    lazy var customView: AddCategoryView? = view as? AddCategoryView

    var presenter: AddCategoryOutput?

    init() {
        super.init(nibName: "AddCategoryView", bundle: Bundle(for: AddCategoryView.self))
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addActionHandlers()
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = Text.AddEvent.add
        navigationItem.rightBarButtonItem = customView?.doneButton
    }

    private func addActionHandlers() {
        customView?.doneButton.action = #selector(doneButtonClicked)
    }

    @objc private func doneButtonClicked() {
        guard
            let name = customView?.addCategoryNameField.text
//            name.isEmpty == false
        else { return }
        let newCategory = CategoryDto(name: name)
        presenter?.createCategory(category: newCategory) { [weak self] result in
            switch result {
            case .success():
                self?.navigationController?.popViewController(animated: true)
            case let .failure(error):
                print("Ошибка: \(error)")
            }
        }
    }
}

extension AddCategoryController: AddCategoryInput {}
