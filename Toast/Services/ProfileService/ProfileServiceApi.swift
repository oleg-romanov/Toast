//
//  EventServiceApi.swift
//  Toast
//
//  Created by Олег Романов on 5/4/21.
//

import Foundation
import KeychainSwift
import Moya

enum ProfileServiceApi {
    case getProfile
}

extension ProfileServiceApi: AccessTokenAuthorizable {
    public var authorizationType: AuthorizationType? { return .bearer }
}

extension ProfileServiceApi: TargetType {
    var keychain: KeychainSwift {
        return KeychainSwift(keyPrefix: Keys.keyPrefix)
    }

    var baseURL: URL {
        return URL(string: URLPath.path)!
    }

    var path: String {
        switch self {
        case .getProfile:
            return "/user"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getProfile:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case .getProfile:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json", "Authorization": "Bearer \(keychain.get(Keys.token)!)"]
    }
}
