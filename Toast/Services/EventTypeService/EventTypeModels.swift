//
//  EventTypeModels.swift
//  Toast
//
//  Created by Олег Романов on 5/24/21.
//

import Foundation

struct CreateEventTypeRequest: Encodable {
    let name: String
}

struct EventTypeResponse: Decodable {
    let id: Int
    let name: String
}

struct GetAllEventTypesResponse: Decodable {
    let eventTypes: [EventType]
}
