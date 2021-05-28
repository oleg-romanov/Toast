//
//  ProfileController.swift
//  Toast
//
//  Created by Олег Романов on 5/27/21.
//

import KeychainSwift
import UIKit

class ProfileController: UIViewController {
    // MARK: - Properties

    lazy var customView: ProfileView? = ProfileView()

    var presenter: ProfileViewOutput?

    private let keychain = KeychainSwift(keyPrefix: Keys.keyPrefix)

    // MARK: - Life cycle

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        addActionHandlers()
    }

    private func addActionHandlers() {
        customView?.logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }

    @objc
    private func logoutButtonTapped() {
        keychain.delete(Keys.token)
        let startController = StartController()
        let presenter = StartPresenter(view: startController)
        startController.presenter = presenter
        let nav = UINavigationController(rootViewController: startController)
        AppDelegate.shared?.window?.rootViewController = nav
    }
}

extension ProfileController: ProfileViewInput {
    func setupProfile(user: User) {
        customView?.nameLabel.text = user.name
    }
}
