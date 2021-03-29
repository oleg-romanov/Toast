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
    lazy var custonView: AddEventView? = view as? AddEventView
    weak var delegate: AddEventControllerDelegate?

    init() {
        super.init(nibName: "AddEventView", bundle: Bundle(for: AddEventView.self))
        setupStyle()
        addActionHandlers()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = Text.AddPerson.add
        navigationItem.rightBarButtonItem = custonView?.doneButton
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        custonView?.doneButton.target = self
        custonView?.doneButton.action = #selector(doneBottonClicked)
    }

    @objc private func doneBottonClicked() {
        guard
            let name = custonView?.nameTextField.text,
            let birthdate = custonView?.datePicker.date,
            name.isEmpty == false
        else { return }
        let newPerson = Event(name: name, birthdate: birthdate, category: "none")
        delegate?.addEvent(newPerson)
        navigationController?.popViewController(animated: true)
    }
}
