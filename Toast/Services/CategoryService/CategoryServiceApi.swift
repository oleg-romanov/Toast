//
//  CategoryServiceApi.swift
//  Toast
//
//  Created by Олег Романов on 5/18/21.
//

import Foundation
import KeychainSwift
import Moya

enum CategoryServiceApi {
    case createCategory(category: Category)
    case getAllCategories
}

extension CategoryServiceApi: AccessTokenAuthorizable {
    public var authorizationType: AuthorizationType? { return .bearer }
}

extension CategoryServiceApi: TargetType {
    var keychain: KeychainSwift {
        return KeychainSwift(keyPrefix: Keys.keyPrefix)
    }

    var baseURL: URL {
        return URL(string: "http://localhost:8080")!
    }

    var path: String {
        switch self {
        case .createCategory:
            return "/category"
        case .getAllCategories:
            return "/category"
        }
    }

    var method: Moya.Method {
        switch self {
        case .createCategory:
            return .post
        case .getAllCategories:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case let .createCategory(category):
            let requestBody = CreateCategoryRequest(id: category.id, name: category.name)
            return .requestJSONEncodable(requestBody)
        case .getAllCategories:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json", "Authorization": "Bearer \(keychain.get(Keys.token)!)"]
    }
}
