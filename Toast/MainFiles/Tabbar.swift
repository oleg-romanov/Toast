//
//  Tabbar.swift
//  Toast
//
//  Created by Олег Романов on 5/28/21.
//

import UIKit

class Tabbar: UITabBarController {
    init(_ fromDeepLink: Bool = false, _ eventId: Int? = nil) {
        super.init(nibName: nil, bundle: nil)
        setup(fromDeepLink, eventId)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup(_ fromDeepLink: Bool = false, _ eventId: Int? = nil) {
        let profileVC = ProfileController()
        let profilPresenter = ProfilePresenter(view: profileVC)
        profileVC.presenter = profilPresenter
        let profileNav = UINavigationController(rootViewController: profileVC)

        let eventsVC = EventsContoller()
        let eventsPresenter = EventsPresenter(view: eventsVC)
        eventsVC.presenter = eventsPresenter
        let eventsNav = UINavigationController(rootViewController: eventsVC)

        profileNav.tabBarItem.image = UIImage(named: "profileIcon")
        eventsNav.tabBarItem.image = UIImage(named: "eventsIcon")

        profileNav.title = "Профиль"
        eventsNav.title = "События"

        if fromDeepLink, let id = eventId {
            eventsVC.showEvent(id: id)
        }
        viewControllers = [eventsNav, profileNav]
    }
}
