//
//  EventModels.swift
//  Toast
//
//  Created by Олег Романов on 5/4/21.
//

import Foundation

struct CustomeError: LocalizedError {
    var errorDescription: String?
}

struct CreateEventRequest: Encodable {
    let name: String
    let description: String
    let date: Date
    let categoryId: Int
}

struct EventResponse: Decodable {
    let id: Int
    let name: String
    let description: String
    let date: Date
    let category: Category
    let user: User
}

struct GetAllEventsResponse: Decodable {
    let events: [Event]
}