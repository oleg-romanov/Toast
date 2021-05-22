//
//  AddEventController.swift
//  Toast
//
//  Created by Олег Романов on 19.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import SPAlert
import UIKit

// protocol AddEventControllerDelegate: AnyObject {
//    func addEvent(_ person: Event)
// }

class AddEventController: UIViewController {
    // MARK: - Properties

    lazy var customView: AddEventView? = view as? AddEventView

//    weak var delegate: AddEventControllerDelegate?

    var presenter: AddEventViewOutput?

    var encoder = JSONEncoder()

    // MARK: - Init

    init() {
        super.init(nibName: "AddEventView", bundle: Bundle(for: AddEventView.self))
        setupStyle()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle() {
        presenter = AddEventPresener(view: self)
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = Text.AddEvent.add
        navigationItem.rightBarButtonItem = customView?.doneButton
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addActionHandlers()
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        customView?.doneButton.target = self
        customView?.doneButton.action = #selector(doneBottonClicked)
        customView?.doneButton.target = self
        customView?.categoryButton.addTarget(self, action: #selector(categoryButtonClicked), for: .touchUpInside)
        customView?.typeButton.addTarget(self, action: #selector(typeButtonClicked), for: .touchUpInside)
    }

    @objc private func doneBottonClicked() {
        guard
            let name = customView?.nameTextField.text,
            let date = customView?.datePicker.date,
            let descriptionTextView = customView?.descriptionTextView.text
        else {
            return
        }
        let event = EventDto(name: name, description: descriptionTextView, date: date, categoryId: 2)
        presenter?.createEvent(event: event) { [weak self] result in
            switch result {
            case .success():
                self?.navigationController?.popViewController(animated: true)
            case let .failure(error):
                print("Ошибка: \(error)")
            }
        }
    }

    @objc func categoryButtonClicked() {
        let categoriesVC = CategoryController()
        let categoriesPresenter = CategoryPresenter(view: categoriesVC)

        categoriesVC.customView.dataSource.closure = { id in
            print(id)
        }

        categoriesVC.presenter = categoriesPresenter
        navigationController?.pushViewController(categoriesVC, animated: true)
        navigationItem.backButtonTitle = ""
    }

    @objc func typeButtonClicked() {
        print("еееее роцк!")
    }
}

extension AddEventController: AddEventViewInput {
    func showError(error: Error) {
        SPAlert.present(message: error.localizedDescription)
    }
}

extension AddEventController: CategoryDelegate {
    func sendCategoryId(categoryId: Int) {}
}
