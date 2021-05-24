//
//  EventTypeCell.swift
//  Toast
//
//  Created by Олег Романов on 5/24/21.
//

import UIKit

class EventTypeCell: UITableViewCell {
    var id: Int?
    var name: String?

    @IBOutlet var nameLabel: UILabel!

    func configure(eventType: EventType) {
        id = eventType.id
        name = eventType.name
        nameLabel.text = name
    }

    func addEventTypeConfigure() {
        nameLabel.text = "Добавить тип события"
    }
}
