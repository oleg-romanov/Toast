//
//  TableModel.swift
//  Toast
//
//  Created by Олег Романов on 04.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

struct EventDto: Encodable {
    var name: String
    var description: String
    var date: Date
    var categoryId: Int
}

struct Event: Decodable {
    var id: Int
    var name: String
    var description: String
    var date: String
    var category: Category
    var user: User
}

struct User: Codable {
    var name: String
}
