//
//  UserMatchView.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 20/09/24.
//

import SwiftUI

struct UserMatchView: View {
    
    @Binding var show: Bool
    
    @EnvironmentObject var matchManager: MatchManager
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea()
            
            VStack(spacing: 120) {
                VStack {
                    //                    Image(.match)
                    Text("It's Match")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Text("")
                    if let matchedUser = matchManager.matchedUser {
                        Text("You and \(matchedUser.fullName) have  liked each other.")
                            .foregroundStyle(.white)
                    }
                    
                }
                    HStack(spacing: 20) {
                        Image(MockData.users[0].profileImage[0])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                                .shadow(radius: 4)
                        }
                        
                        if let matchedUser = matchManager.matchedUser {
                            Image(matchedUser.profileImage[0])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .shadow(radius: 4)
                            }
                        }
                        
                        
                    }
                    
                    VStack(spacing: 16) {
                        Button("Send Message") {
                            show.toggle()
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(Capsule())
                        
                        Button("Keep Swiping") {
                            show.toggle()
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.clear)
                        
                        .overlay {
                            Capsule()
                                .stroke(.white, lineWidth: 1)
                                .shadow(radius: 4)
                        }
                    }
                }
        }
    }
}

#Preview {
    UserMatchView(show: .constant(true))
        .environmentObject(MatchManager())
}
