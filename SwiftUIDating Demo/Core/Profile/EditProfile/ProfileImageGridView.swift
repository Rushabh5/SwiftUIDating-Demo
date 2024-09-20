//
//  ProfileImageGridView.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 13/09/24.
//

import SwiftUI

struct ProfileImageGridView: View {
    
    let user: User
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(0..<6) { index in
                if index < user.profileImage.count {
                    Image(user.profileImage[index])
                        .resizable()
                        .scaledToFill()
                        .foregroundStyle(.black)
                        .frame(width: 110, height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    ZStack(alignment: .bottomTrailing) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.secondarySystemBackground))
                            .frame(width: 110, height: 160)
                        
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                            .foregroundStyle(.red)
                            .offset(x: 4, y:4)
                    }
                }
            }
        }
    }
}

private extension ProfileImageGridView {
    var columns: [GridItem] {
        [.init(.flexible()),
         .init(.flexible()),
         .init(.flexible())
        ]
    }
        
}

#Preview {
    ProfileImageGridView(user: MockData.users[0])
}
