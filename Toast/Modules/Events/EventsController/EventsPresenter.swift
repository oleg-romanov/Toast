//
//  EventsPresenter.swift
//  Toast
//
//  Created by Олег Романов on 5/12/21.
//

import KeychainSwift
import UIKit

class EventsPresenter {
    private weak var view: EventsViewInput?

    private let keychain = KeychainSwift(keyPrefix: Keys.keyPrefix)

    private let service: EventServiceProtocol

    init(view: EventsViewInput, service: EventServiceProtocol = EventService()) {
        self.view = view
        self.service = service
    }
}

extension EventsPresenter: EventsViewOutput {
    func getAllEvents() -> [Event] {
        return []
    }
}
