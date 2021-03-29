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

//    override var inputAccessoryView: UIView? {
//        customView?.view
//    }
//
//    override var canBecomeFirstResponder: Bool {
//        true
//    }

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

    private func addActionHandlers() {}

    @objc private func signInTapped() {
        AppDelegate.shared?.window?.rootViewController = StartController()
    }

//    @objc private func signUpTapped() {
//        guard
//            let name = customView?.usernameTextField.text,
//            let email = customView?.emailTextField.text,
//            let password = customView?.passwordTextField.text,
//            name.isEmpty == false,
//            email.isEmpty == false,
//            password.isEmpty == false
//        else {
//            showError(message: "неверный email")
//            return
//        }
//        AuthService.shared.signUp(name: name, email: email, password: password, completion: (
//            { [weak self] result in
//                switch result {
//                case let .success(tokenResponse):
//                    UserDefaults.standard.setValue(tokenResponse.token, forKey: "token")
//                    AppDelegate.shared?.window?.rootViewController = EventsContoller()
//                case let .failure(error):
//                    self?.showError(message: error.localizedDescription)
//                }
//            }
//        ))
//    }

    private func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
