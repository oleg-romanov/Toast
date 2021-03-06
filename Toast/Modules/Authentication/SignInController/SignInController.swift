//
//  SignInController.swift
//  Toast
//
//  Created by Олег Романов on 3/16/21.
//

import UIKit

class SignInController: UIViewController {
    // MARK: - Properties

    lazy var customView: SignInView? = view as? SignInView

    var presenter: SignInViewOutput?

    // MARK: - Init

    init() {
        super.init(nibName: "SignInView", bundle: Bundle(for: SignInView.self))
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        presenter = SignInPresenter(view: self)
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addActionHandlers()
        title = "Вход"
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        customView?.registrationButton.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        customView?.passwordRecoveryButton.addTarget(self, action: #selector(passwordRecoveryButtonTapped), for: .touchUpInside)
        customView?.signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }

    @objc private func registrationButtonTapped() {
        let signUpVC = SignUpController()
        let signUpPresenter = SignUpPresenter(view: signUpVC)
        signUpVC.presenter = signUpPresenter
        navigationController?.pushViewController(signUpVC, animated: true)
        navigationItem.backButtonTitle = ""
    }

    @objc private func passwordRecoveryButtonTapped() {
        navigationController?.pushViewController(EnterEmailController(), animated: true)
        navigationItem.backButtonTitle = ""
    }

    @objc private func signInButtonTapped() {
        guard
            let email = customView?.emailTextField.text,
            let password = customView?.passwordTextField.text
        else {
            return
        }
        customView?.spinner.isHidden = false
        customView?.spinner.startAnimating()
        presenter?.signInWithEmail(email: email, password: password)
    }
}

extension SignInController: SignInViewInput {
    func stopAnimating() {
        customView?.spinner.stopAnimating()
    }

    func showError(message: String) {}

    func presentEvents() {
        let eventsVC = EventsContoller()
        let eventsPresenter = EventsPresenter(view: eventsVC)
        eventsVC.presenter = eventsPresenter
        guard let window = AppDelegate.shared?.window else {
            return
        }
        let tabbar = Tabbar()
        UIWindow.transition(with: window, duration: 0.3, options: .transitionFlipFromLeft, animations: {
            window.rootViewController = tabbar
        })
    }
}
