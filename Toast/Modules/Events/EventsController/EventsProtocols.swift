//
//  EventsProtocols.swift
//  Toast
//
//  Created by Олег Романов on 5/12/21.
//

import Foundation

protocol EventsViewInput: AnyObject {}

protocol EventsViewOutput: AnyObject {
    func getAllEvents() -> [Event]
}
