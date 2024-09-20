//
//  MatchManager.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 20/09/24.
//

import Foundation

@MainActor
class MatchManager: ObservableObject {
    @Published var matchedUser: User?
    
    func checkForMatch(withUser user: User) -> Bool {
        let didMatch = Bool.random()
        if didMatch  {
            matchedUser = user
        }
        return Bool.random()
    }
}
