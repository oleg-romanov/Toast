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

    init() {
        super.init(nibName: nil, bundle: nil)
        view = customView
        setup()
        addActionHandlers()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    override func loadView() {
//        view = customView
//
//    }

    override func viewDidLoad() {
        setup()
        addActionHandlers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadEvents()
        customView.dataSource?.detailedEventClosure = { [weak self] event in
            self?.presentDetailedEvent(event: event)
        }
    }

    // MARK: - Init

    private func setup() {
        presenter = EventsPresenter(view: self)
        navigationItem.title = Text.Events.title
        navigationItem.rightBarButtonItem = customView.addPersonButton
        customView.initDataSource()
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

    // MARK: - In

    func showEvent(id: Int) {
        presenter?.getEvent(id: id)
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
    func presentDetailedEvent(event: Event) {
        let detailedVC = DetailedEventController(event: event)
        navigationController?.pushViewController(detailedVC, animated: true)
    }

    func reloadEvents() {
        presenter?.getAllEvents()
    }

    func loadEvents(events: [Event]) {
        customView.updateData(events)
    }
}
