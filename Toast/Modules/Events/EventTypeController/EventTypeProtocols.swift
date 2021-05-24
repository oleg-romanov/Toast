//
//  EventTypeProtocols.swift
//  Toast
//
//  Created by Олег Романов on 5/24/21.
//

import Foundation

protocol EventTypeViewInput: AnyObject {
    func reloadEventTypes()
    func loadEventTypes(eventTypes: [EventType])
    func presentAddEventType()
}

protocol EventTypeViewOutput: AnyObject {
    func getAllEventTypes()
    func createEventType(eventType: EventType)
}
