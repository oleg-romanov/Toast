//
//  AddEventProtocols.swift
//  Toast
//
//  Created by Олег Романов on 5/4/21.
//

import Foundation

protocol AddEventViewInput: AnyObject {
//    func presentCategories()
    func showError(error: Error)
}

protocol AddEventViewOutput: AnyObject {
    func createEvent(event: EventDto, complition: @escaping (Result<Void, Error>) -> Void)
}
