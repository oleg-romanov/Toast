//
//  AddEventPresenter.swift
//  Toast
//
//  Created by Олег Романов on 5/4/21.
//

import KeychainSwift
import UIKit

final class AddEventPresener {
    private weak var view: AddEventViewInput?

    private let keychain = KeychainSwift(keyPrefix: Keys.keyPrefix)

    private let service: EventServiceProtocol

    init(view: AddEventViewInput, service: EventServiceProtocol = EventService()) {
        self.view = view
        self.service = service
    }
}

extension AddEventPresener: AddEventViewOutput {
    func createEvent(event: EventDto, complition: @escaping (Result<Void, Error>) -> Void) {
        service.createEvent(event: event) { [weak self] result in
            switch result {
            case let .success(event: event):
                print(event)
                complition(.success(()))
            case let .failure(error):
                complition(.failure(error))
                self?.view?.showError(error: error)
                print(error)
            }
        }
    }
}
