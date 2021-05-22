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

    @IBOutlet var nameLabel: UILabel!

    func configure(category: Category) {
        id = category.id
        name = category.name
        nameLabel.text = name
    }

    func addCategoryConfigure() {
        nameLabel.text = "Добавить категорию"
    }
}
