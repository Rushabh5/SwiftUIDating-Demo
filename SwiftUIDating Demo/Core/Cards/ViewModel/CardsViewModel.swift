//
//  ViewModel.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 12/09/24.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
    @Published var cardModel = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?
    
    private let service: CardService
    
    init(service: CardService) {
        self.service = service
        Task { await fetchCardModel() }
    }
    
    func fetchCardModel() async {
        do {
            self.cardModel = try await service.fetchCardModel()
        } catch {
            print("Error FetchCardModel")
        }
    }
    
    func removeCard(_ card: CardModel) {
        Task {
            try await Task.sleep(nanoseconds: 500_000_000)
            guard let index = cardModel.firstIndex(where: {$0.id == card.id}) else  { return }
            cardModel.remove(at: index)
        }
    }
}
