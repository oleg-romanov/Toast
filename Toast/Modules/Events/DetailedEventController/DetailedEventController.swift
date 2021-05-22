//
//  DetailedEventController.swift
//  Toast
//
//  Created by Олег Романов on 5/22/21.
//

import UIKit

class DetailedEventController: UIViewController {
    var customView = DetailedEventView()

    override func loadView() {
        view = customView
    }
}
