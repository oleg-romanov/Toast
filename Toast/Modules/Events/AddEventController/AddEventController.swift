//
//  AddEventController.swift
//  Toast
//
//  Created by Олег Романов on 19.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

protocol AddEventControllerDelegate: AnyObject {
    func addEvent(_ person: Event)
}

class AddEventController: UIViewController {
    // MARK: - Properties

    lazy var customView: AddEventView? = view as? AddEventView

    weak var delegate: AddEventControllerDelegate?

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
//        guard
//            let name = custonView?.nameTextField.text,
//            let birthdate = custonView?.datePicker.date,
//            name.isEmpty == false
//        else { return }
        // MOCK

//        let newPerson = Event(name: name, date: birthdate, category: "none")
//        delegate?.addEvent(newPerson)
        let dateFormatter = DateFormatter()
        let date = Date(timeIntervalSinceNow: 12312)
        dateFormatter.timeStyle = .short
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let day = dateFormatter.string(from: date)
        print(day)
        let event = Event(name: "TesssstEvent1", description: "Cool description", date: Date(), categoryId: 1)
        presenter?.createEvent(event: event)
        navigationController?.popViewController(animated: true)
    }

    @objc func categoryButtonClicked() {
        print("юхууу, я вызван")
        let categoriesVC = CategoryController()
        let categoriesPresenter = CategoryPresenter(view: categoriesVC)
        categoriesVC.presenter = categoriesPresenter
        navigationController?.pushViewController(categoriesVC, animated: true)
        navigationItem.backButtonTitle = ""
    }

    @objc func typeButtonClicked() {
        print("еееее роцк!")
    }
}

extension AddEventController: AddEventViewInput {}
