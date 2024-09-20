//
//  ProfileHeaderView.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 13/09/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(user.profileImage[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 130)
                .clipShape(Circle())
                .background {
                    Circle()
                        .fill(Color(.systemGray6))
                        .frame(width: 138, height: 138)
                        .shadow(radius: 10)
                }
                
                Image(systemName: "pencil")
                    .imageScale(.small)
                    .foregroundStyle(.gray)
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                    }
                    .offset(x: -8, y: 10)
                
            }
            Text("\(user.fullName) \(user.age)")
                .font(.title2)
                .fontWeight(.light)
        }
        .frame(height: 240)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ProfileHeaderView(user: MockData.users[0])
}
