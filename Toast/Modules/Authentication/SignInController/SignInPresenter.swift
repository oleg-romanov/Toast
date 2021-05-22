//
//  SignInPresenter.swift
//  Toast
//
//  Created by Олег Романов on 3/31/21.
//

import Foundation
import KeychainSwift

final class SignInPresenter {
    private weak var view: SignInViewInput?

    private let keychain = KeychainSwift(keyPrefix: Keys.keyPrefix)

    //
    private let service: AuthServiceProtocol

    init(view: SignInViewInput, service: AuthServiceProtocol = AuthService()) {
        self.view = view
        self.service = service
    }
}

extension SignInPresenter: SignInViewOutput {
    func signInWithEmail(email: String, password: String) {
        service.signIn(email: email, password: password) { [weak self] result in
            switch result {
            case let .success(tokenResponse):
                self?.keychain.set(tokenResponse.token, forKey: Keys.token)
                self?.view?.presentEvents()
            case let .failure(error):
                self?.view?.showError(message: error.localizedDescription)
                print(error.localizedDescription)
            }
        }
    }
}
