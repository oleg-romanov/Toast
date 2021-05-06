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
    let eventTypeId: Int
    let categoryId: Int
}

struct EventResponse: Decodable {
    let name: String
    let description: String
    let date: Date
    let eventTypeId: Int
    let categoryId: Int
}
