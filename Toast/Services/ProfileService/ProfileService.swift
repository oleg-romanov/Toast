//
//  EventService.swift
//  Toast
//
//  Created by Олег Романов on 5/4/21.
//

import Foundation
import Moya

enum GetProfileResult {
    case success(user: User)
    case failure(error: Error)
}

protocol ProfileServiceProtocol {
    func getProfile(completion: @escaping (GetProfileResult) -> Void)
}

class ProfileService: ProfileServiceProtocol {
    let dataProvider = MoyaProvider<ProfileServiceApi>(plugins: [
        NetworkLoggerPlugin(),
    ])

    func getProfile(completion: @escaping (GetProfileResult) -> Void) {
        dataProvider.request(.getProfile) { result in
            switch result {
            case let .success(moyaResponse):
                guard (200 ... 299).contains(moyaResponse.statusCode)
                else {
                    let message = try? moyaResponse.map(String.self, atKeyPath: "message")
                    completion(.failure(error: CustomError(errorDescription: message)))
                    return
                }
                do {
                    let dataResponse = try moyaResponse.map(User.self)
                    completion(.success(user: dataResponse))
                } catch {
                    completion(.failure(error: error))
                }
            case let .failure(error):
                completion(.failure(error: error))
            }
        }
    }
}
