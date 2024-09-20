//
//  UserInfo.swift
//  AmountDemo
//
//  Created by Rushabh Shah on 11/09/24.
//

import SwiftUI

struct UserInfo: View {
    @Binding var showProfileModel: Bool
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(user.fullName)
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("\(user.age)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    showProfileModel.toggle()
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                    
                }
            }
            
            Text(user.bio ?? "")
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    UserInfo(showProfileModel: .constant(false), user: MockData.users[0])
}
