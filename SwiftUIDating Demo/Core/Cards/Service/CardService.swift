//
//  CardService.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 12/09/24.
//

import Foundation

struct CardService {
    func fetchCardModel() async throws -> [CardModel] {
        let user = MockData.users
        return user.map({CardModel(user: $0)})
    }
}
