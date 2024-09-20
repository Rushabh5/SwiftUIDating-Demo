//
//  CardModel.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 12/09/24.
//

import Foundation

struct CardModel {
    let user: User
}

extension CardModel: Identifiable, Hashable {
    var id: String { return user.id }
}
