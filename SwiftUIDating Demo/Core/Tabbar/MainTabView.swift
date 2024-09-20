//
//  MainTabbar.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 11/09/24.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CardStackView()
                .tabItem { Image(.flameIcon)
                    .renderingMode(.template) }
                .tag(0)
            
            Text("Search View")
                .tabItem { Image(.searchIcon) .renderingMode(.template) }
                .tag(1)
            
            Text("Inbox View")
                .tabItem { Image(.messageIcon)
                    .renderingMode(.template)}
                .tag(2)
            
//            UserProfileView(user: user)
            ProfileVC(user: MockData.users[0])
                .tabItem { Image(.profileIcon)
                    .renderingMode(.template) }
                .tag(3)
        }
        .tint(.primary)
    }
}

#Preview {
    MainTabView()
        .environmentObject(MatchManager())
}
