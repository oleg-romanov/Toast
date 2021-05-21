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
}

protocol EventsViewOutput: AnyObject {
    func getAllEvents()
}
