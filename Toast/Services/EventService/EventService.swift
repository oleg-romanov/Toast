//
//  EventService.swift
//  Toast
//
//  Created by Олег Романов on 5/4/21.
//

import Foundation
import Moya

enum CreateEventResult {
    case success(event: Event)
    case failure(error: String)
}

protocol EventServiceProtocol {
    func createEvent(event: Event, completion: @escaping (CreateEventResult) -> Void)
}

class EventService: EventServiceProtocol {
    let dataProvider = MoyaProvider<EventServiceApi>(plugins: [
        NetworkLoggerPlugin(),
        AccessTokenPlugin(tokenClosure: { _ in "типо кейчейн" ?? "" })
] )

    func createEvent(event: Event, completion: @escaping (CreateEventResult) -> Void) {
        print(event)
        dataProvider.request(.createEvent(event: event)) { result in
            switch result {
            case let .success(moyaResponse):
                guard (200 ... 299).contains(moyaResponse.statusCode)
                else {
                    let message = try? moyaResponse.map(String.self, atKeyPath: "message")
                    completion(.failure(error: message!))
                    return
                }
                do {
//                    let data = try decoder.decode(Event.self, from: moyaResponse.data)
                    let dataResponse = try moyaResponse.map(Event.self)
                    print(dataResponse)
                    completion(.success(event: dataResponse))
                } catch {
                    completion(.failure(error: "Mistake"))
                }
            case let .failure(error):
                completion(.failure(error: "\(error)"))
            }
        }
    }
}
