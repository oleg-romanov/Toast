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
    func deleteEvent(by id: Int)
    func showError(message: String)
}

protocol EventsViewOutput: AnyObject {
    func getAllEvents()
    func getEvent(id: Int)
    func deleteEvent(by id: Int, complition: @escaping (Result<String, Error>) -> Void)
}
