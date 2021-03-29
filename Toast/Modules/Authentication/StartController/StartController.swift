//
//  StartController.swift
//  Toast
//
//  Created by Олег Романов on 1/20/21.
//  Copyright © 2021 Oleg Romanov. All rights reserved.
//

import UIKit

class StartController: UIViewController {
    // MARK: - Properties

    lazy var customView: StartView? = StartView()

    // MARK: - Life cycle

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addActionHandlers()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: - Action handlers

    private func addActionHandlers() {
        customView?.signInWithEmail.addTarget(self, action: #selector(signInWithEmailTapped), for: .touchUpInside)
    }

    @objc private func signInWithEmailTapped() {
        navigationController?.pushViewController(SignInController(), animated: true)
        navigationItem.backButtonTitle = ""
    }
}