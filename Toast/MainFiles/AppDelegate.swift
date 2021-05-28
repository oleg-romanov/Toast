//
//  AppDelegate.swift
//  Toast
//
//  Created by Олег Романов on 26.07.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import KeychainSwift
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    static var shared: AppDelegate?

    lazy var window: UIWindow? = UIWindow()

    let keychain = KeychainSwift(keyPrefix: Keys.keyPrefix)

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.shared = self
        let firstController: UIViewController
        if keychain.get(Keys.token) == nil {
            let viewController = StartController()
            let presenter = StartPresenter(view: viewController)
            viewController.presenter = presenter
            firstController = viewController
            let nav = UINavigationController(rootViewController: firstController)
            window?.rootViewController = nav
        } else {
            let viewController = EventsContoller()
            let presenter = EventsPresenter(view: viewController)
            viewController.presenter = presenter
            firstController = viewController
            let tabbar = Tabbar()
            window?.rootViewController = tabbar
        }

//        let nav = UINavigationController(rootViewController: firstController)
        window?.makeKeyAndVisible()
        DeepLinkNavigator.shared.window = window
        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        if let deepLink = DeepLinkType.handle(url: url) {
            DeepLinkNavigator.shared.proceedToDeepLink(deepLink)
        }
        return true
    }
}
