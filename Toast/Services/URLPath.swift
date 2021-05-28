//
//  URLPath.swift
//  Toast
//
//  Created by Олег Романов on 5/27/21.
//

import Foundation

enum URLPath: String {
    case localhost = "http://localhost:8080"
    case ip1 = "http://192.168.1.6:8080"
    case ip2 = "http://192.168.1.83:8080"

    static let path = URLPath.ip2.rawValue
}
