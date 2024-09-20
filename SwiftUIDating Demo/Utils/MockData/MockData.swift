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
            fullName: "Mark Zuckerberg",
            age: 40,
            bio: "iOS Developer | Swift | Objective-C | Swift UI",
            profileImage: [
                "rp-1",
                "rp-3"
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Priscilla Chan",
            age: 35,
            bio: "Android & Flutter Developer",
            profileImage: [
                "pr-1",
                "pr-2",
                "rp-2"
            ]
        ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Randi Zuckerberg",
            age: 22,
            bio: "MBBS | Heart Specialist",
            profileImage: [
                "prisha-1",
                "prisha-2"
            ]
        ),
    ]
    
}
