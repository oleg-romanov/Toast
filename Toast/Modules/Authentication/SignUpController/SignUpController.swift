//
//  SignUpController.swift
//  Toast
//
//  Created by Олег Романов on 1/20/21.
//  Copyright © 2021 Oleg Romanov. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    // MARK: - Properties

    lazy var customView: SignUpView? = view as? SignUpView

    var presenter: SignUpOutput?

    // MARK: - Init

    init() {
        super.init(nibName: "SignUpView", bundle: Bundle(for: SignUpView.self))
        setupStyle()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupStyle() {
        addActionHandlers()
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистрация"
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        customView?.signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    }

    @objc private func signUpTapped() {
        guard
            let name = customView?.nameTextField.text,
            let email = customView?.emailTextField.text,
            let password = customView?.passwordTextField.text
        else { return }
        if customView?.passwordTextField.text != customView?.confirmPassTextField.text {
            print("Пароли не совпадают...")
            return
        }
        presenter?.signUpWithEmail(email: email, password: password, name: name)
    }
}

extension SignUpController: SignUpInput {
    func presentEvents() {
        let eventsVC = EventsContoller()
        let navigationController = UINavigationController(rootViewController: eventsVC)
        guard let window = AppDelegate.shared?.window
        else {
            return
        }
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromLeft, animations: {
            window.rootViewController = navigationController
        })
    }

    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
