//
//  AddEventView.swift
//  Toast
//
//  Created by Олег Романов on 19.08.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

class AddEventView: UIView {
    // MARK: - Properties

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var arrowImageViewCategory: UIImageView!
    @IBOutlet var arrowImageViewType: UIImageView!
    @IBOutlet var categoryButton: UIButton!
    @IBOutlet var typeButton: UIButton!

    lazy var doneButton = UIBarButtonItem(
        title: Text.AddEvent.done, style: .done, target: nil, action: nil
    )

    // MARK: - Init

    override func awakeFromNib() {
        addActionHandlers()
    }

    @IBAction func action(_ sender: Any) {
        print("so")
    }

    private func setupStyle() {
        arrowImageViewCategory.image = Assets.arrowIcon.image
        arrowImageViewType.image = Assets.arrowIcon.image
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Action handlers

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

    // MARK: - Private methods

    private func adjustContentInset(_ contentInset: CGFloat) {
        scrollView.contentInset.bottom = contentInset
    }
}
