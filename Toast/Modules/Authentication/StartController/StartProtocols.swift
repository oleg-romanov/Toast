//
//  StartProtocols.swift
//  Toast
//
//  Created by Олег Романов on 3/31/21.
//

import Foundation

protocol StartViewInput: AnyObject {}

protocol StartViewOutput: AnyObject {
    func signInWithEmailTapped()
}
