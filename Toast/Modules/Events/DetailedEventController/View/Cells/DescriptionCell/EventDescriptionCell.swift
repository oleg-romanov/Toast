//
//  EventDescriptionCell.swift
//  Toast
//
//  Created by Олег Романов on 5/25/21.
//

import UIKit

class EventDescriptionCell: UITableViewCell {
    @IBOutlet var textView: UITextView!

    var item: EventViewModelItem? {
        didSet {
            guard let item = item as? EventViewModelDescriptionItem else {
                return
            }
            textView?.text = item.description
        }
    }
}
