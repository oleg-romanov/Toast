//
//  CategoryCell.swift
//  Toast
//
//  Created by Олег Романов on 5/10/21.
//

import UIKit

class CategoryCell: UITableViewCell {
    var id: Int?
    var name: String?

    func configure(category: Category) {
        id = category.id
        name = category.name
    }
}
