//
//  SignInView.swift
//  Toast
//
//  Created by Олег Романов on 3/16/21.
//

import SnapKit
import UIKit

class SignInView: UIView {
    // MARK: - Properties

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var emailTextField: MDTextField!
    @IBOutlet var passwordRecoveryButton: UIButton!
    @IBOutlet var registrationButton: UIButton!
    private lazy var signInButton = ButtonDefault(title: "Войти")

    // MARK: - Init

    override func awakeFromNib() {
        addSubview(signInButton)
        makeConstraints()
        addActionHandlers()
    }

    private func makeConstraints() {
        signInButton.snp.makeConstraints { make in
            make.width.equalTo(UIScreen.main.bounds.width - 32)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }

    // MARK: - Action Handlers

    private func addActionHandlers() {
        let defaultNotificationCenter = NotificationCenter.default
        defaultNotificationCenter.addObserver(
            self,
            selector: #selector(keyboardWillShow(notification:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        defaultNotificationCenter.addObserver(
            self,
            selector: #selector(keyboardWillHide(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(onViewTap)
        )
        addGestureRecognizer(tapGestureRecognizer)
    }

    @objc private func onViewTap() {
        endEditing(true)
    }

    // MARK: - Private methods

    private func adjustContentInset(_ contentInset: CGFloat) {
        scrollView.contentInset.bottom = contentInset
        signInButton.snp.updateConstraints { make in
            make.bottom.equalToSuperview().inset(contentInset + 20)
        }
        UIView.animate(withDuration: 0.1) {
            self.layoutIfNeeded()
        }
    }

    // MARK: - Keyboard action notification

    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
            as? NSValue
        else {
            return
        }

        let keyboardSize = keyboardFrame.cgRectValue.size
        adjustContentInset(keyboardSize.height)
    }

    @objc private func keyboardWillHide(notification _: NSNotification) {
        adjustContentInset(.zero)
    }
}
