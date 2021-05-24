//
//  AddEventTypeProtocols.swift
//  Toast
//
//  Created by Олег Романов on 5/24/21.
//

import Foundation

protocol AddEventTypeInput: AnyObject {}

protocol AddEventTypeOutput: AnyObject {
    func createEventType(eventType: EventTypeDto, complition: @escaping (Result<Void, Error>) -> Void)
}
