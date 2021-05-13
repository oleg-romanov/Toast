//
//  TableModel.swift
//  Toast
//
//  Created by Олег Романов on 04.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

struct Event: Codable {
    var name: String
    var description: String
    var date: Date
    var categoryId: Int
}

// MARK: - Static

//    static func generateData() -> [Event] {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd.MM.yyyy"
//
//       let event1 = Event(
//           name: "Михаил",
//           date: dateFormatter.date(from: "25.03.1997"),
//           category: "Друзья"
//       )
//       let event2 = Event(
//           name: "Дмитрий",
//           date: dateFormatter.date(from: "11.03.1999"),
//           category: "Друзья"
//       )
//       let event3 = Event(
//           name: "Валерия",
//           date: dateFormatter.date(from: "05.04.1997"),
//           category: "Друзья"
//       )
//       let event4 = Event(
//           name: "Олег",
//           date: dateFormatter.date(from: "30.03.2001"),
//           category: "Коллеги"
//       )
//       let event5 = Event(
//           name: "Айдар",
//           date: dateFormatter.date(from: "04.12.1998"),
//           category: "Друзья"
//       )
//
//        return [event1, event2, event3, event4, event5]
//    }
