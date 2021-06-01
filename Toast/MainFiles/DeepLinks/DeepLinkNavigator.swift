//
//  DeepLinkNavigator.swift
//  Toast
//
//  Created by Олег Романов on 5/27/21.
//

import UIKit

class DeepLinkNavigator {
    static let shared = DeepLinkNavigator()
    private init() {}
    var window: UIWindow?

    func proceedToDeepLink(_ type: DeepLinkType) {
        switch type {
        case let .event(id):
            let eventsVC = EventsContoller()
            let eventsPresenter = EventsPresenter(view: eventsVC)
            eventsVC.presenter = eventsPresenter
//            let navigationController = UINavigationController(rootViewController: eventsVC)
            let tabbar = Tabbar()
            eventsVC.showEvent(id: id)
            window?.rootViewController = tabbar
        }
    }
}
