//
//  MockData.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 12/09/24.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullName: "Rushabh",
            age: 31,
            bio: "iOS Developer | Swift | Objective-C | Swift UI",
            profileImage: [
                "rp-1",
                "rp-2"
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Pooja",
            age: 28,
            bio: "Android & Flutter Developer",
            profileImage: [
                "pr-1",
                "pr-2",
                "rp-2"
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Prisha",
            age: 18,
            bio: "MBBS | Heart",
            profileImage: [
                "prisha-1"
            ]
        ),
    ]
    
}
