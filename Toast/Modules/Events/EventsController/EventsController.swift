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

    var presenter: EventsViewOutput?

    // MARK: - Life cycle

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        setup()
        addActionHandlers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadEvents()
    }

    // MARK: - Init

    private func setup() {
        presenter = EventsPresenter(view: self)
        navigationItem.title = Text.Events.title
        navigationItem.rightBarButtonItem = customView.addPersonButton
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        customView.addPersonButton.target = self
        customView.addPersonButton.action = #selector(addEventButtonClicked)
    }

    @objc private func addEventButtonClicked() {
        let addEventController = AddEventController()
        let addEventPresenter = AddEventPresener(view: addEventController)
        addEventController.presenter = addEventPresenter
//        addEventController.delegate = self
        navigationController?.pushViewController(addEventController, animated: true)
    }
}

// MARK: - AddEventControllerDelegate

// extension EventsContoller: AddEventControllerDelegate {
//    func addEvent(_ event: Event) {
//        customView.addEvent(event)
//        SPAlert.present(
//            title: Text.Events.done,
//            message: "\(event.name)" + Text.Events.message,
//            preset: .done
//        )
//    }
// }

extension EventsContoller: EventsViewInput {
    func reloadEvents() {
        presenter?.getAllEvents()
    }

    func loadEvents(events: [Event]) {
        customView.updateData(events)
    }
}
