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
        let button: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            button.setTitle("sdgddg", for: .normal)
            return button
        }()
        view.addSubview(button)
        button.addTarget(self, action: #selector(someMethod), for: .touchUpInside)
//        customView.updateData(Event.generateData())
    }

    @objc func someMethod() {
        print("")
    }

    // MARK: - Init

    private func setupStyle() {
        navigationItem.title = Text.Events.title
        navigationItem.rightBarButtonItem = customView.addPersonButton
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        customView.addPersonButton.target = self
        customView.addPersonButton.action = #selector(addPersonButtonClicked)
    }

    @objc private func addPersonButtonClicked() {
        let addEventController = AddEventController()
        let addEventPresenter = AddEventPresener(view: addEventController)
        addEventController.presenter = addEventPresenter
        addEventController.delegate = self
        navigationController?.pushViewController(addEventController, animated: true)
    }
}

// MARK: - AddEventControllerDelegate

extension EventsContoller: AddEventControllerDelegate {
    func addEvent(_ event: Event) {
        customView.addEvent(event)
        SPAlert.present(
            title: Text.Events.done,
            message: "\(event.name)" + Text.Events.message,
            preset: .done
        )
    }
}
