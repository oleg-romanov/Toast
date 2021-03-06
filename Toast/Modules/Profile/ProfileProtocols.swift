//
//  ProfileProtocols.swift
//  Toast
//
//  Created by Олег Романов on 5/27/21.
//

import Foundation

protocol ProfileViewInput: AnyObject {
    func setupProfile()
    func presentProfileName(user: User)
}

protocol ProfileViewOutput: AnyObject {
    func getProfile()
}
