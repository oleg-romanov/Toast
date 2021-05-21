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

    let decoder = JSONDecoder()

    let dateFormatter = DateFormatter()

    func createEvent(event: EventDto, completion: @escaping (CreateEventResult) -> Void) {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        dataProvider.request(.createEvent(event: event)) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .success(moyaResponse):
                guard (200 ... 299).contains(moyaResponse.statusCode)
                else {
                    let message = try? moyaResponse.map(String.self, atKeyPath: "message")
                    completion(.failure(error: CustomError(errorDescription: message)))
                    return
                }
                do {
                    let dataResponse = try strongSelf.decoder.decode(Event.self, from: moyaResponse.data)
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
        dateFormatter.dateFormat = "yyyy-MM-dd"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        dataProvider.request(.getAllEvents) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case let .success(moyaResponse):
                guard (200 ... 299).contains(moyaResponse.statusCode)
                else {
                    let message = try? moyaResponse.map(String.self, atKeyPath: "message")
                    completion(.failure(error: CustomError(errorDescription: message)))
                    return
                }
                do {
                    let dataResponse = try strongSelf.decoder.decode([Event].self, from: moyaResponse.data)
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
