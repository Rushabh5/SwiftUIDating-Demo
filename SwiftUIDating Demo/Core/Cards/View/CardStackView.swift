//
//  CardStackView.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 12/09/24.
//

import SwiftUI

struct CardStackView: View {
    @EnvironmentObject private var matchManager: MatchManager
    @State private var showMatchView = false
    @StateObject var viewModel = CardsViewModel(service: CardService())
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16) {
                    ZStack {
                        ForEach(viewModel.cardModel) {card in
                            CardView(viewModel: viewModel, model: card)
                                
                        }
                    }
                    if !viewModel.cardModel.isEmpty {
                        SwipeActionButtonView(viewModel: viewModel)
                    }
                }
                .blur(radius: showMatchView ? 20 : 0)
                if showMatchView {
                    UserMatchView(show: $showMatchView)
                }
            }
            .animation(.easeIn, value: showMatchView)
            .onReceive(matchManager.$matchedUser, perform: { user in
//                showMatchView.toggle()
                showMatchView = user != nil
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.navigationIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 88)
                }
            }
        }
    }
}

#Preview {
    CardStackView()
        .environmentObject(MatchManager())
}
