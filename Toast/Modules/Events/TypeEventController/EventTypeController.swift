//
//  EventTypeController.swift
//  Toast
//
//  Created by Олег Романов on 5/23/21.
//

import UIKit

class EventTypeController: UIViewController {
    var customView = EventTypeView()

    var presenter: EventTypeViewOutput?

    init() {
        super.init(nibName: nil, bundle: nil)
        view = customView
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        reloadEventTypes()
        customView.dataSource?.addEventTypeClosure = { [weak self] in
            self?.presentAddEventType()
        }
    }

    private func setup() {
        navigationItem.title = Text.Categories.title
//        navigationItem.rightBarButtonItem = customView.addPersonButton
//        customView?.dataSource?.delegate = self
        customView.initDataSource()
    }
}

extension EventTypeController: EventTypeViewInput {
    func presentAddEventType() {
//        let addCategoryController = AddCategoryController()
//        let addCategoryPresenter = AddCategoryPresenter(view: addCategoryController)
//        addCategoryController.presenter = addCategoryPresenter
//        navigationController?.pushViewController(addCategoryController, animated: true)
    }

    func reloadEventTypes() {
        presenter?.getAllEventTypes()
    }

    func loadEventTypes(eventTypes: [EventType]) {
        customView.updateData(eventTypes)
    }
}
