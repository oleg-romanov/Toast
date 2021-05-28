//
//  EventsProtocols.swift
//  Toast
//
//  Created by Олег Романов on 5/12/21.
//

import Foundation

protocol EventsViewInput: AnyObject {
    func reloadEvents()
    func loadEvents(events: [Event])
    func presentDetailedEvent(event: Event)
}

protocol EventsViewOutput: AnyObject {
    func getAllEvents()
    func getEvent(id: Int)
}
