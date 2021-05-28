//
//  EventParticipantsCell.swift
//  Toast
//
//  Created by Олег Романов on 5/25/21.
//

import UIKit

class EventParticipantsCell: UITableViewCell {
    @IBOutlet var participantNameLabel: UILabel!

    var item: User? {
        didSet {
            guard let item = item else {
                return
            }
            participantNameLabel?.text = item.name
        }
    }
}
