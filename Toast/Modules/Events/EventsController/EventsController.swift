//
//  EventsContoller.swift
//  Toast
//
//  Created by Олег Романов on 04.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import SPAlert
import UIKit

final class EventsContoller: UIViewController {
    // MARK: - Properties

    var customView = EventsView()

    // MARK: - Life cycle

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        setupStyle()
        addActionHandlers()
        customView.updateData(Event.generateData())
    }

    // MARK: - Init

    private func setupStyle() {
        navigationItem.title = Text.Persons.title
        navigationItem.rightBarButtonItem = customView.addPersonButton
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        customView.addPersonButton.target = self
        customView.addPersonButton.action = #selector(addPersonButtonClicked)
    }

    @objc private func addPersonButtonClicked() {
        let nextController = AddEventController()
        nextController.delegate = self
        navigationController?.pushViewController(nextController, animated: true)
    }
}

// MARK: - AddEventControllerDelegate

extension EventsContoller: AddEventControllerDelegate {
    func addEvent(_ event: Event) {
        customView.addEvent(event)
        SPAlert.present(
            title: Text.Persons.done,
            message: "\(event.name)" + Text.Persons.message,
            preset: .done
        )
    }
}
