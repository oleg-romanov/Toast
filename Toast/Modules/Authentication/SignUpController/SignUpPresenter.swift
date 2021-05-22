//
//  SignUpPresenter.swift
//  Toast
//
//  Created by Олег Романов on 4/7/21.
//

import Foundation
import KeychainSwift

final class SignUpPresenter {
    private weak var view: SignUpInput?

    private let keychain = KeychainSwift(keyPrefix: Keys.keyPrefix)

    private let authService: AuthServiceProtocol

    init(view: SignUpInput, service: AuthServiceProtocol = AuthService()) {
        self.view = view
        self.authService = service
    }
}

extension SignUpPresenter: SignUpOutput {
    func signUpWithEmail(email: String, password: String, name: String) {
        authService.signUp(name: name, email: email, password: password, completion: ({ [weak self] result in
            switch result {
            case let .success(tokenResponse):
                self?.keychain.set(tokenResponse.token, forKey: Keys.token)
                self?.view?.presentEvents()
            case let .failure(error):
                self?.view?.showError(message: error.localizedDescription)
            }
        }
        ))
    }
}
