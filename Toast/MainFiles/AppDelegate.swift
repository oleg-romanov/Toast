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
        let vc: UIViewController
        if keychain.get(Keys.token) == nil {
            if UserDefaults.standard.bool(forKey: "isNotFirst") {
                let viewController = StartController()
                let presenter = StartPresenter(view: viewController)
                viewController.presenter = presenter
                firstController = viewController
                vc = UINavigationController(rootViewController: firstController)
                UserDefaults.standard.set(true, forKey: "isNotFIrst")
            } else {
                vc = OnboardingController()
            }
            window?.rootViewController = vc
        } else {
            let tabbar = Tabbar()
            window?.rootViewController = tabbar
        }
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
