//
//  AuthModels.swift
//  Toast
//
//  Created by Олег Романов on 1/21/21.
//  Copyright © 2021 Oleg Romanov. All rights reserved.
//

import Foundation

struct CustomError: LocalizedError {
    var errorDescription: String?
}

struct SignInRequest: Encodable {
    let email: String
    let password: String
}

struct SignUpRequest: Encodable {
    let name: String
    let email: String
    let password: String
}

struct TokenResponse: Decodable {
    let token: String
}
