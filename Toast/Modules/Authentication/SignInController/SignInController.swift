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

    // MARK: - Init

    init() {
        super.init(nibName: "SignInView", bundle: Bundle(for: SignInView.self))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    }

    @objc private func registrationButtonTapped() {
        navigationController?.pushViewController(SignUpController(), animated: true)
        navigationItem.backButtonTitle = ""
    }

    @objc private func passwordRecoveryButtonTapped() {
        navigationController?.pushViewController(PasswordResetController(), animated: true)
        navigationItem.backButtonTitle = ""
    }
}
