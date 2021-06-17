//
//  SignInProtocols.swift
//  Toast
//
//  Created by Олег Романов on 3/31/21.
//

import Foundation

protocol SignInViewInput: AnyObject {
    func showError(message: String)
    func presentEvents()
    func stopAnimating()
}

protocol SignInViewOutput: AnyObject {
    func signInWithEmail(email: String, password: String)
}
