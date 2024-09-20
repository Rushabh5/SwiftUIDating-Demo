//
//  AmountDemoApp.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 11/09/24.
//

import SwiftUI

@main
struct AmountDemoApp: App {
    @StateObject var matchObject = MatchManager()
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(matchObject)
        }
    }
}
