//
//  DeepLinkType.swift
//  Toast
//
//  Created by Олег Романов on 5/27/21.
//

import UIKit

enum DeepLinkType {
    case event(id: Int)

    static func handle(url: URL) -> DeepLinkType? {
        guard
            let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true),
            let host = urlComponents.host
        else {
            return nil
        }
        switch host {
        case "event":
            if let idStr = urlComponents.queryItems?.first?.value,
                let id = Int(idStr)
            {
                return DeepLinkType.event(id: id)
            }
            return nil
        default:
            return nil
        }
    }
}
