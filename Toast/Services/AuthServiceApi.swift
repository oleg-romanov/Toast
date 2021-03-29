//
//  AuthServiceApi.swift
//  Toast
//
//  Created by Олег Романов on 1/21/21.
//  Copyright © 2021 Oleg Romanov. All rights reserved.
//

import Moya

enum AuthServiceApi {
    case signIn(email: String, password: String)
    case signUp(username: String, email: String, password: String)
}

extension AuthServiceApi: TargetType {
    // тот самый url
    var baseURL: URL {
        return URL(string: "http://192.168.1.31:8080")!
    }

    var path: String {
        switch self {
        case .signIn:
            return "/sign-in"
        case .signUp:
            return "/sign-up"
        }
    }

    var method: Method {
        return .post
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case let .signIn(email, password):
            let requestBody = SignInRequest(email: email, password: password)
            return .requestJSONEncodable(requestBody)
        case let .signUp(username, email, password):
            let requestBody = SignUpRequest(name: username, email: email, password: password)
            return .requestJSONEncodable(requestBody)
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
