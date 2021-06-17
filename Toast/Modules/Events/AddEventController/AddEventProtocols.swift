//
//  AddEventProtocols.swift
//  Toast
//
//  Created by Олег Романов on 5/4/21.
//

import Foundation

protocol AddEventViewInput: AnyObject {
    func showError(error: Error)
    func stopAnimating()
}

protocol AddEventViewOutput: AnyObject {
    func createEvent(event: EventDto, complition: @escaping (Result<Event, Error>) -> Void)
}
