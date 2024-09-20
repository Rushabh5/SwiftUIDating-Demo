//
//  CardView.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 11/09/24.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardsViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degree: CGFloat = 0
    @State private var currentImageIndex: Int = 0
    @State private var showProfileModel = false
    @EnvironmentObject var matchMana: MatchManager
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImage[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstats.cardWidth, height: SizeConstats.cardHeight)
                    .overlay {
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                SwipeActionIndicatiorView(xOffset: $xOffset)
                
            }
            
            UserInfo(showProfileModel: $showProfileModel, user: user)
        }
        .fullScreenCover(isPresented: $showProfileModel) {
            UserProfileView(user: user)
        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
                onReceiveSwipeAction(action)
        })
        .frame(width: SizeConstats.cardWidth, height: SizeConstats.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degree))
        .animation(.snappy, value: degree)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    func returnToCenter() {
        xOffset = 0
        degree = 0
    }
    
    func swipeRight() {
        xOffset = 500
        degree = 12
        viewModel.removeCard(model)
        matchMana.checkForMatch(withUser: user)
    }
    
    func swipeLeft() {
        withAnimation { //For iOS 17 and above
            xOffset = -500
            degree = -12
        } completion: {
            viewModel.removeCard(model)
        }
    }
    
    func onReceiveSwipeAction(_ action: SwipeAction?)  {
        guard let action else { return }
        
        let topCard = viewModel.cardModel.last
        
        if topCard == model {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degree = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        if abs(width) <= abs(SizeConstats.screenCutOff) {
//            xOffset = 0
//            degree = 0
            returnToCenter()
            return
        }
        
        if width >= SizeConstats.screenCutOff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}

private extension CardView {
    var user: User {
        return model.user
    }
    
    var imageCount: Int {
        return user.profileImage.count
    }
}

#Preview {
    CardView(
        viewModel: CardsViewModel(
            service: CardService()
        ),
        model: CardModel(
            user: MockData.users[1]
        )
    )
}
