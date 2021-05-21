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
    case failure(error: Error)
}

enum GetAllEventsResult {
    case success(events: [Event])
    case failure(error: Error)
}

protocol EventServiceProtocol {
    func createEvent(event: EventDto, completion: @escaping (CreateEventResult) -> Void)
    func getAllEvents(completion: @escaping (GetAllEventsResult) -> Void)
}

class EventService: EventServiceProtocol {
    let dataProvider = MoyaProvider<EventServiceApi>(plugins: [
        NetworkLoggerPlugin(),
    ])

    func createEvent(event: EventDto, completion: @escaping (CreateEventResult) -> Void) {
        print(event)
        dataProvider.request(.createEvent(event: event)) { result in
            switch result {
            case let .success(moyaResponse):
                guard (200 ... 299).contains(moyaResponse.statusCode)
                else {
                    let message = try? moyaResponse.map(String.self, atKeyPath: "message")
                    completion(.failure(error: CustomError(errorDescription: message)))
                    return
                }
                do {
                    let dataResponse = try moyaResponse.map(Event.self)
                    print(dataResponse)
                    completion(.success(event: dataResponse))
                } catch {
                    completion(.failure(error: error))
                }
            case let .failure(error):
                completion(.failure(error: error))
            }
        }
    }

    func getAllEvents(completion: @escaping (GetAllEventsResult) -> Void) {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        dataProvider.request(.getAllEvents) { result in
            switch result {
            case let .success(moyaResponse):
                guard (200 ... 299).contains(moyaResponse.statusCode)
                else {
                    let message = try? moyaResponse.map(String.self, atKeyPath: "message")
                    completion(.failure(error: CustomError(errorDescription: message)))
                    return
                }
                do {
                    let dataResponse = try decoder.decode([Event].self, from: moyaResponse.data)
//                    let dataResponse = try moyaResponse.map([Event].self)
                    completion(.success(events: dataResponse))
                } catch {
                    completion(.failure(error: error))
                }
            case let .failure(error):
                completion(.failure(error: error))
            }
        }
    }
}
