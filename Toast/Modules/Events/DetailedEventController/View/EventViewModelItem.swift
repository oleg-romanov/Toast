//
//  EventViewModelItem.swift
//  Toast
//
//  Created by Олег Романов on 5/25/21.
//

import Foundation

protocol EventViewModelItem {
    var type: EventViewModelItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String { get }
}

extension EventViewModelItem {
    var rowCount: Int {
        return 1
    }
}

enum EventViewModelItemType {
    case date
//    case participants
    case description
}
