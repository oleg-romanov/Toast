//
//  CategoryProtocols.swift
//  Toast
//
//  Created by Олег Романов on 5/10/21.
//

import Foundation

protocol CategoryViewInput: AnyObject {
    func reloadCategories()
    func loadCategories(categories: [Category])
    func presentAddCategory()
}

protocol CategoryViewOutput: AnyObject {
    func getAllCategories()
    func createCategory(category: Category)
}
