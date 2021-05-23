//
//  AddCategoryProtocols.swift
//  Toast
//
//  Created by Олег Романов on 5/23/21.
//

import Foundation

protocol AddCategoryInput: AnyObject {}

protocol AddCategoryOutput: AnyObject {
    func createCategory(category: CategoryDto, complition: @escaping (Result<Void, Error>) -> Void)
}
