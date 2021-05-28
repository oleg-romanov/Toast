//
//  ProfilePresenter.swift
//  Toast
//
//  Created by Олег Романов on 5/27/21.
//

import KeychainSwift
import UIKit

final class ProfilePresenter {
    private weak var view: ProfileViewInput?

    private let keychain = KeychainSwift(keyPrefix: Keys.keyPrefix)

    private let service: ProfileServiceProtocol

    init(view: ProfileViewInput, service: ProfileServiceProtocol = ProfileService()) {
        self.view = view
        self.service = service
    }
}

extension ProfilePresenter: ProfileViewOutput {
    func getProfile(user: User) {
        service.getProfile { [weak self] result in
            switch result {
            case let .success(user: user):
                self?.view?.setupProfile(user: user)
            case let .failure(error: error):
                print(error)
            }
        }
    }
}
