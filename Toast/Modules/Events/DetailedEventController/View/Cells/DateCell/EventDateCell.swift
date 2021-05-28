//
//  EventDateCell.swift
//  Toast
//
//  Created by Олег Романов on 5/25/21.
//

import UIKit

class EventDateCell: UITableViewCell {
    @IBOutlet var dateLabel: UILabel!

    var item: EventViewModelItem? {
        didSet {
            guard let item = item as? EventViewModelDateItem else {
                return
            }
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .medium
            dateLabel.text = dateFormatter.string(from: item.date)
        }
    }
}
