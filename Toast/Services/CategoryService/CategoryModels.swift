//
//  CategoryModels.swift
//  Toast
//
//  Created by Олег Романов on 5/12/21.
//

import Foundation

struct CreateCategoryRequest: Encodable {
    let id: Int
    let name: String
}

struct CategoryResponse: Decodable {
    let id: Int
    let name: String
}

struct GetAllCategoriesResponse: Decodable {
    let categories: [Category]
}
