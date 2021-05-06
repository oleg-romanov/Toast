//
//  AppDelegate.swift
//  Toast
//
//  Created by Олег Романов on 26.07.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    static var shared: AppDelegate?

    lazy var window: UIWindow? = UIWindow()

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppDelegate.shared = self
//        if UserDefaults.standard.string(forKey: "token") == nil {
//            window?.rootViewController = OnboardingController()
//        } else {
//            let navigationController = UINavigationController(rootViewController: EventsContoller())
//            window?.rootViewController = navigationController
//        }
        let viewController = StartController()
        let presenter = StartPresenter(view: viewController)
        viewController.presenter = presenter

        let nav = UINavigationController(rootViewController: viewController)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }
}
