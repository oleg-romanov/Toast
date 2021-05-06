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
    var presenter: AddEventViewOutput?
    var encoder = JSONEncoder()

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
        navigationItem.title = Text.AddEvent.add
        navigationItem.rightBarButtonItem = custonView?.doneButton
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        custonView?.doneButton.target = self
        custonView?.doneButton.action = #selector(doneBottonClicked)
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
        let event = Event(name: "BBB", description: "Addf", date: Date(), eventTypeId: 1, categoryId: 1)
        presenter?.createEvent(event: event)
        navigationController?.popViewController(animated: true)
    }
}

extension AddEventController: AddEventViewInput {}
