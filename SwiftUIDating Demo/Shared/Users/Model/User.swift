//
//  User.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 12/09/24.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let fullName: String
    var age: Int
    var bio: String
    var profileImage: [String]
}
