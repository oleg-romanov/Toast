//
//  SignUpProtocols.swift
//  Toast
//
//  Created by Олег Романов on 4/7/21.
//

import Foundation

protocol SignUpInput: AnyObject {
    func showError(message: String)
    func presentEvents()
    func stopAnimating()
}

protocol SignUpOutput: AnyObject {
    func signUpWithEmail(email: String, password: String, name: String)
}
