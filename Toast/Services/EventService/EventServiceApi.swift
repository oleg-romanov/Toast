//
//  EventServiceApi.swift
//  Toast
//
//  Created by Олег Романов on 5/4/21.
//

import Foundation
import KeychainSwift
import Moya

enum EventServiceApi {
    case createEvent(event: EventDto)
    case getAllEvents
}

extension EventServiceApi: AccessTokenAuthorizable {
    public var authorizationType: AuthorizationType? { return .bearer }
}

extension EventServiceApi: TargetType {
    var keychain: KeychainSwift {
        return KeychainSwift(keyPrefix: Keys.keyPrefix)
    }

    var baseURL: URL {
        return URL(string: "http://localhost:8080")!
    }

    var path: String {
        switch self {
        case .createEvent:
            return "/event"
        case .getAllEvents:
            return "/event"
        }
    }

    var method: Moya.Method {
        switch self {
        case .createEvent:
            return .post
        case .getAllEvents:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        switch self {
        case let .createEvent(event):
            let encoder = JSONEncoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            encoder.dateEncodingStrategy = .formatted(dateFormatter)
            let requestBody = CreateEventRequest(name: event.name, description: event.description, date: event.date, categoryId: event.categoryId)
            return .requestCustomJSONEncodable(requestBody, encoder: encoder)
        case .getAllEvents:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json", "Authorization": "Bearer \(keychain.get(Keys.token)!)"]
    }
}