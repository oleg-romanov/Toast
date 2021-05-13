//
//  AddEventProtocols.swift
//  Toast
//
//  Created by Олег Романов on 5/4/21.
//

import Foundation

protocol AddEventViewInput: AnyObject {
//    func presentCategories()
}

protocol AddEventViewOutput: AnyObject {
    func createEvent(event: Event)
}
